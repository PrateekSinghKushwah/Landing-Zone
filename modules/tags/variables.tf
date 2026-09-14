variable "organization_id" {
  description = "Numeric Google Cloud organization ID."
  type        = string
}

variable "short_name" {
  description = "Short name for the tag key."
  type        = string
}

variable "description" {
  description = "Description of the tag key."
  type        = string
  default     = null
}

variable "values" {
  description = "Tag values keyed by a stable Terraform identifier."
  type = map(object({
    short_name  = string
    description = optional(string)
  }))
  default = {}
}
