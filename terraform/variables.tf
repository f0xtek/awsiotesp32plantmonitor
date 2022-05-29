variable "sns_sms_endpoint" {
  type        = string
  description = "The SMS number to subscribe to the SNS topic."

  validation {
    condition     = can(regex("^(\\+\\d{1,3}[- ]?)?\\d{10}$", var.sns_sms_endpoint))
    error_message = "Invalid mobile number format."
  }
}