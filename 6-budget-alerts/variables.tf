variable "billing_account_id" {
  description = "Billing account ID without the billingAccounts prefix."
  type        = string
}

variable "budgets" {
  description = "Budgets keyed by a stable Terraform identifier."
  type = map(object({
    display_name                     = string
    amount                           = number
    currency_code                    = optional(string, "USD")
    projects                         = optional(set(string), [])
    threshold_percentages            = optional(set(number), [0.5, 0.8, 1.0])
    monitoring_notification_channels = optional(set(string), [])
    disable_default_iam_recipients   = optional(bool, false)
  }))
  default = {}
}
