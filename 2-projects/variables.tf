variable "projects" {
  description = "Projects keyed by a stable Terraform identifier."
  type = map(object({
    project_id         = string
    name               = string
    folder_id          = string
    billing_account_id = string
    services           = optional(set(string), [])
    labels             = optional(map(string), {})
    deletion_policy    = optional(string, "PREVENT")
  }))
  default = {}
}
