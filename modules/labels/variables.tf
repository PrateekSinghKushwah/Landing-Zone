variable "environment" {
  description = "Deployment environment, for example prod or nonprod."
  type        = string
}

variable "managed_by" {
  description = "Management system label."
  type        = string
  default     = "terraform"
}

variable "cost_center" {
  description = "Cost allocation label."
  type        = string
}

variable "additional_labels" {
  description = "Additional labels to merge with the standard label set."
  type        = map(string)
  default     = {}
}
