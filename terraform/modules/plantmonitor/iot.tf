data "aws_iam_policy_document" "iot_cert_policy" {
  statement {
    effect    = "Allow"
    actions   = ["iot:*"]
    resources = ["*"]
  }
}

resource "aws_iot_certificate" "iot_cert" {
  active = true
}

resource "aws_iot_policy" "cert_policy" {
  name   = "plantmonitor"
  policy = data.aws_iam_policy_document.iot_cert_policy.json
}

resource "aws_iot_policy_attachment" "cert_policy" {
  policy = aws_iot_policy.cert_policy.name
  target = aws_iot_certificate.iot_cert.arn
}

data "aws_iam_policy_document" "sns" {
  count = var.sms_rule_enabled ? 1 : 0
  statement {
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.sms_topic[count.index].arn]
  }
}

data "aws_iam_policy_document" "sns-assume-role" {
  count = var.sms_rule_enabled ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["iot.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_policy" "sns-sms" {
  count       = var.sms_rule_enabled ? 1 : 0
  policy      = data.aws_iam_policy_document.sns[count.index].json
  name_prefix = "plantmonitor_sns_sms"
  tags        = var.tags
}

resource "aws_iam_role" "sns-sms" {
  count                 = var.sms_rule_enabled ? 1 : 0
  assume_role_policy    = data.aws_iam_policy_document.sns-assume-role[count.index].json
  name_prefix           = "plantmonitor_sns_sms"
  force_detach_policies = true
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "sns-sms" {
  count      = var.sms_rule_enabled ? 1 : 0
  policy_arn = aws_iam_policy.sns-sms[count.index].arn
  role       = aws_iam_role.sns-sms[count.index].name
}

resource "aws_iot_topic_rule" "sms" {
  count       = var.sms_rule_enabled ? 1 : 0
  enabled     = var.sms_rule_enabled
  name        = "plantmonitor_sms"
  sql         = "SELECT * FROM 'esp32PlantMonitor'"
  sql_version = "2016-03-23"

  sns {
    role_arn       = aws_iam_role.sns-sms[count.index].arn
    target_arn     = aws_sns_topic.sms_topic[count.index].arn
    message_format = "RAW"
  }

  tags = merge(var.tags, { Name = "plantmonitor-sms" })
}