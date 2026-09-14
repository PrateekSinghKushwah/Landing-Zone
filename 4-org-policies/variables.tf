variable "organization_id" {
  description = "Numeric Google Cloud organization ID."
  type        = string
}

variable "org_policies" {
  description = "Boolean organization policies keyed by a stable Terraform identifier."
  type = map(object({
    constraint = string
    enforce    = optional(string, "TRUE")
  }))
  default = {}
}
