variable "organization_id" {
  description = "Numeric Google Cloud organization ID."
  type        = string
}

variable "folders" {
  description = "Folders keyed by a stable Terraform identifier."
  type = map(object({
    display_name = string
    parent_id    = optional(string)
  }))
  default = {}
}
