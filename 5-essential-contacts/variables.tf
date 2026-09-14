variable "organization_id" {
  description = "Numeric Google Cloud organization ID."
  type        = string
}

variable "contacts" {
  description = "Essential contacts keyed by a stable Terraform identifier."
  type = map(object({
    email                   = string
    notification_categories = set(string)
    language_tag            = optional(string, "en-US")
  }))
  default = {}
}
