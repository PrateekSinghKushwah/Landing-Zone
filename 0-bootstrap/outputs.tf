output "state_bucket_name" {
  description = "Name of the remote Terraform state bucket."
  value       = module.terraform_state.name
}

output "terraform_service_account_email" {
  description = "Email of the service account Terraform should impersonate after bootstrap."
  value       = google_service_account.terraform.email
}
