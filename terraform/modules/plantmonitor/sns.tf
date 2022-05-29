#tfsec:ignore:aws-sns-enable-topic-encryption
resource "aws_sns_topic" "sms_topic" {
  count        = var.sms_rule_enabled ? 1 : 0
  display_name = "plantmonitor_sms_topic"
  fifo_topic   = false
  name_prefix  = "plantmonitor_sms"
  tags     = var.tags
}

resource "aws_sns_topic_subscription" "sms" {
  count     = var.sms_rule_enabled ? 1 : 0
  endpoint  = replace(var.sns_sms_endpoint, " ", "")
  protocol  = "sms"
  topic_arn = aws_sns_topic.sms_topic[count.index].arn
}
