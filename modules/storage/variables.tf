variable "name" {
  description = "Globally unique bucket name."
  type        = string
}

variable "project_id" {
  description = "Project that owns the bucket."
  type        = string
}

variable "location" {
  description = "GCS bucket location."
  type        = string
}

variable "labels" {
  description = "Labels to apply to the bucket."
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Whether object versioning is enabled."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow deletion when the bucket contains objects."
  type        = bool
  default     = true
}
