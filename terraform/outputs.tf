#######
# IOT #
#######

output "iot_certificate_pem" {
  value     = module.plantmonitor.iot_certificate_pem
  sensitive = true
}

output "iot_certificate_public_key" {
  value     = module.plantmonitor.iot_certificate_public_key
  sensitive = true
}

output "iot_certificate_private_key" {
  value     = module.plantmonitor.iot_certificate_private_key
  sensitive = true
}

output "iot_certificate_active" {
  value = module.plantmonitor.iot_certificate_active
}

output "iot_certificate_arn" {
  value = module.plantmonitor.iot_certificate_arn
}

output "iot_policy_arn" {
  value = module.plantmonitor.iot_policy_arn
}

output "iot_policy_name" {
  value = module.plantmonitor.iot_policy_name
}

#######
# SNS #
#######

output "sms_topic_arn" {
  value = module.plantmonitor.sms_topic_arn
}

output "sms_topic_name" {
  value = module.plantmonitor.sms_topic_name
}

output "sms_topic_display_name" {
  value = module.plantmonitor.sms_topic_display_name
}

output "sms_topic_subscription_arn" {
  value = module.plantmonitor.sms_topic_subscription_arn
}

output "sms_topic_subscription_confirmation_timeout_minutes" {
  value = module.plantmonitor.sms_topic_subscription_confirmation_timeout_minutes
}

output "sms_topic_subscription_confirmation_was_authenticated" {
  value = module.plantmonitor.sms_topic_subscription_confirmation_was_authenticated
}

output "sms_topic_subscription_endpoint" {
  value     = module.plantmonitor.sms_topic_subscription_endpoint
  sensitive = true
}

output "sms_topic_subscription_owner_id" {
  value = module.plantmonitor.sms_topic_subscription_owner_id
}

output "sms_topic_subscription_topic_arn" {
  value = module.plantmonitor.sms_topic_subscription_arn
}

output "sms_role_arn" {
  value = module.plantmonitor.sms_role_arn
}

output "sms_role_name" {
  value = module.plantmonitor.sms_role_name
}

output "sms_role_max_session_duration" {
  value = module.plantmonitor.sms_role_max_session_duration
}

output "sms_role_tags" {
  value = module.plantmonitor.sms_role_tags
}

output "sms_policy_arn" {
  value = module.plantmonitor.sms_policy_arn
}

output "sms_policy_name" {
  value = module.plantmonitor.sms_policy_name
}

output "sms_policy_tags" {
  value = module.plantmonitor.sms_policy_tags
}
