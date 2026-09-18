resource "google_service_account" "terraform" {
  project      = var.bootstrap_project_id
  account_id   = var.terraform_service_account_id
  display_name = "Terraform Landing Zone"
  description  = "Terraform automation identity for the landing zone."
}

resource "google_iam_workload_identity_pool" "github" {
  project                   = var.bootstrap_project_id
  workload_identity_pool_id = var.github_workload_identity_pool_id
  display_name              = "GitHub Actions"
  description               = "OIDC identities from the Landing-Zone GitHub repository."
}

resource "google_iam_workload_identity_pool_provider" "github" {
  project                            = var.bootstrap_project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = var.github_workload_identity_provider_id
  display_name                       = "GitHub Actions OIDC"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "impersonation" {
  for_each = var.impersonation_principals

  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = each.value
}

resource "google_service_account_iam_member" "github_workload_identity" {
  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_repository}"
}

module "terraform_state" {
  source = "../modules/storage"

  name               = var.state_bucket_name
  project_id         = var.bootstrap_project_id
  location           = var.region
  labels             = var.labels
  versioning_enabled = true
}

