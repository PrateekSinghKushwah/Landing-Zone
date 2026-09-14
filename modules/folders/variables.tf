variable "display_name" {
  description = "Human-readable folder name."
  type        = string
}

variable "parent" {
  description = "Parent resource, for example organizations/123456789 or folders/123456789."
  type        = string
}
