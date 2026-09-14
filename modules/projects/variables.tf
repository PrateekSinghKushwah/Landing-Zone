variable "project_id" {
  description = "Immutable Google Cloud project ID."
  type        = string
}

variable "name" {
  description = "Human-readable project name."
  type        = string
}

variable "folder_id" {
  description = "Numeric folder ID that will contain the project."
  type        = string
}

variable "billing_account_id" {
  description = "Billing account ID without the billingAccounts prefix."
  type        = string
}

variable "services" {
  description = "Service APIs to enable in the project."
  type        = set(string)
  default     = []
}

variable "labels" {
  description = "Labels applied to the project."
  type        = map(string)
  default     = {}
}

variable "deletion_policy" {
  description = "Project deletion behavior: PREVENT, DELETE, or ABANDON."
  type        = string
  default     = "PREVENT"

  validation {
    condition     = contains(["PREVENT", "DELETE", "ABANDON"], var.deletion_policy)
    error_message = "deletion_policy must be PREVENT, DELETE, or ABANDON."
  }
}
