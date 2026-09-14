variable "billing_account_id" {
  description = "Billing account ID without the billingAccounts prefix."
  type        = string
}

variable "display_name" {
  description = "Budget display name."
  type        = string
}

variable "amount" {
  description = "Budget amount in whole currency units."
  type        = number
}

variable "currency_code" {
  description = "ISO 4217 currency code."
  type        = string
  default     = "USD"
}

variable "projects" {
  description = "Projects to include, using projects/PROJECT_NUMBER resource names."
  type        = set(string)
  default     = []
}

variable "threshold_percentages" {
  description = "Budget thresholds expressed as decimal percentages, such as 0.5 or 1.0."
  type        = set(number)
  default     = [0.5, 0.8, 1.0]
}

variable "monitoring_notification_channels" {
  description = "Cloud Monitoring notification-channel resource names."
  type        = set(string)
  default     = []
}

variable "disable_default_iam_recipients" {
  description = "Disable automatic alerts to billing-account IAM recipients."
  type        = bool
  default     = false
}
