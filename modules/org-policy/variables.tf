variable "organization_id" {
  description = "Numeric Google Cloud organization ID."
  type        = string
}

variable "constraint" {
  description = "Organization Policy constraint, without the policies prefix."
  type        = string
}

variable "enforce" {
  description = "Policy enforcement state: TRUE or FALSE."
  type        = string
  default     = "TRUE"

  validation {
    condition     = contains(["TRUE", "FALSE"], var.enforce)
    error_message = "enforce must be TRUE or FALSE."
  }
}
