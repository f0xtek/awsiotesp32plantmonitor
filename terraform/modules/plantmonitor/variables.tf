variable "region" {
  type        = string
  description = "The AWS Region."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to be applied to all resources."
  default     = {}
}

variable "sns_sms_endpoint" {
  type        = string
  description = "The SMS number of subscribe to the topic."
  validation {
    condition     = can(regex("^(\\+\\d{1,3}[- ]?)?\\d{10}$", var.sns_sms_endpoint))
    error_message = "Invalid mobile number format."
  }
}

variable "sms_rule_enabled" {
  type        = bool
  description = "Enable SNS SMS rule."
  default     = false
}
