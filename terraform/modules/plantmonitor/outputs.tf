#######
# IOT #
#######

output "iot_certificate_pem" {
  value     = aws_iot_certificate.iot_cert.certificate_pem
  sensitive = true
}

output "iot_certificate_public_key" {
  value     = aws_iot_certificate.iot_cert.public_key
  sensitive = true
}

output "iot_certificate_private_key" {
  value     = aws_iot_certificate.iot_cert.private_key
  sensitive = true
}

output "iot_certificate_active" {
  value = aws_iot_certificate.iot_cert.active
}

output "iot_certificate_arn" {
  value = aws_iot_certificate.iot_cert.arn
}

output "iot_policy_arn" {
  value = aws_iot_policy.cert_policy.arn
}

output "iot_policy_name" {
  value = aws_iot_policy.cert_policy.name
}

#######
# SNS #
#######

output "sms_topic_arn" {
  value = aws_sns_topic.sms_topic.arn
}

output "sms_topic_name" {
  value = aws_sns_topic.sms_topic.name
}

output "sms_topic_display_name" {
  value = aws_sns_topic.sms_topic.display_name
}

output "sms_topic_subscription_arn" {
  value = aws_sns_topic_subscription.sms.arn
}

output "sms_topic_subscription_confirmation_timeout_minutes" {
  value = aws_sns_topic_subscription.sms.confirmation_timeout_in_minutes
}

output "sms_topic_subscription_confirmation_was_authenticated" {
  value = aws_sns_topic_subscription.sms.confirmation_was_authenticated
}

output "sms_topic_subscription_endpoint" {
  value     = aws_sns_topic_subscription.sms.endpoint
  sensitive = true
}

output "sms_topic_subscription_owner_id" {
  value = aws_sns_topic_subscription.sms.owner_id
}

output "sms_topic_subscription_topic_arn" {
  value = aws_sns_topic_subscription.sms.topic_arn
}

output "sms_role_arn" {
  value = aws_iam_role.sns-sms.arn
}

output "sms_role_name" {
  value = aws_iam_role.sns-sms.name
}

output "sms_role_max_session_duration" {
  value = aws_iam_role.sns-sms.max_session_duration
}

output "sms_role_tags" {
  value = aws_iam_role.sns-sms.tags
}

output "sms_policy_arn" {
  value = aws_iam_policy.sns-sms.arn
}

output "sms_policy_name" {
  value = aws_iam_policy.sns-sms.name
}

output "sms_policy_tags" {
  value = aws_iam_policy.sns-sms.tags
}
