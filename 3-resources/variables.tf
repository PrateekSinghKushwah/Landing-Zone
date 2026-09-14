variable "storage_buckets" {
  description = "Hardened storage buckets keyed by a stable Terraform identifier."
  type = map(object({
    name               = string
    project_id         = string
    location           = string
    labels             = optional(map(string), {})
    versioning_enabled = optional(bool, true)
  }))
  default = {}
}
