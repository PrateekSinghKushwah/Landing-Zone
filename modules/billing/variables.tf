variable "project_id" {
  description = "Project ID to associate with billing."
  type        = string
}

variable "billing_account_id" {
  description = "Billing account ID without the billingAccounts prefix."
  type        = string
}
