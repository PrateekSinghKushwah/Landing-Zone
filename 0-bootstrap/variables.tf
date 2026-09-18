variable "bootstrap_project_id" {
  description = "Existing project that will host the Terraform state bucket."
  type        = string
}

variable "state_bucket_name" {
  description = "Globally unique name for the Terraform state bucket."
  type        = string
}

variable "terraform_service_account_id" {
  description = "Account ID for the Terraform automation service account."
  type        = string
  default     = "terraform"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.terraform_service_account_id))
    error_message = "terraform_service_account_id must be 6-30 lowercase letters, numbers, or hyphens; it must start with a letter and end with a letter or number."
  }
}

variable "github_repository" {
  description = "GitHub repository allowed to authenticate through Workload Identity Federation, in OWNER/REPOSITORY form."
  type        = string
}

variable "github_workload_identity_pool_id" {
  description = "ID of the Google Cloud Workload Identity Pool for GitHub Actions."
  type        = string
  default     = "github-actions"
}

variable "github_workload_identity_provider_id" {
  description = "ID of the OIDC provider in the GitHub Actions Workload Identity Pool."
  type        = string
  default     = "github"
}

variable "impersonation_principals" {
  description = "IAM principals allowed to mint tokens for the Terraform service account."
  type        = set(string)
  default     = []
}

variable "region" {
  description = "Storage location for state, such as ASIA or us-central1."
  type        = string
  default     = "ASIA"
}

variable "labels" {
  description = "Labels applied to the state bucket."
  type        = map(string)
  default = {
    managed-by = "terraform"
    purpose    = "terraform-state"
  }
}
