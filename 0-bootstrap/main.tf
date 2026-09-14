resource "google_service_account" "terraform" {
  project      = var.bootstrap_project_id
  account_id   = var.terraform_service_account_id
  display_name = "Terraform Landing Zone"
  description  = "Terraform automation identity for the landing zone."
}

resource "google_service_account_iam_member" "impersonation" {
  for_each = var.impersonation_principals

  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = each.value
}

module "terraform_state" {
  source = "../modules/storage"

  name               = var.state_bucket_name
  project_id         = var.bootstrap_project_id
  location           = var.region
  labels             = var.labels
  versioning_enabled = true
}

