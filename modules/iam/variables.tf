variable "organization_id" {
  description = "Numeric Google Cloud organization ID."
  type        = string
}

variable "role" {
  description = "IAM role to grant."
  type        = string
}

variable "member" {
  description = "Member in IAM principal syntax, such as group:platform@example.com."
  type        = string
}
