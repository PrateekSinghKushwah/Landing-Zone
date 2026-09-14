variable "project_id" {
  description = "Project ID to protect."
  type        = string
}

variable "reason" {
  description = "Human-readable reason for the lien."
  type        = string
}

variable "origin" {
  description = "System that owns the lien."
  type        = string
  default     = "terraform"
}

variable "restrictions" {
  description = "Resource-manager operations blocked by the lien."
  type        = set(string)
  default     = ["resourcemanager.projects.delete"]
}
