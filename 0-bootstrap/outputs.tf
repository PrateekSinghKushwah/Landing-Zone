output "state_bucket_name" {
  description = "Name of the remote Terraform state bucket."
  value       = module.terraform_state.name
}

output "terraform_service_account_email" {
  description = "Email of the service account Terraform should impersonate after bootstrap."
  value       = google_service_account.terraform.email
}


output "github_workload_identity_provider" {
  description = "Full provider resource name for the GCP_WORKLOAD_IDENTITY_PROVIDER GitHub secret."
  value       = google_iam_workload_identity_pool_provider.github.name
}
