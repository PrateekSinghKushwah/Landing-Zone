resource "google_project" "this" {
  project_id          = var.project_id
  name                = var.name
  folder_id           = var.folder_id
  billing_account     = var.billing_account_id
  labels              = var.labels
  auto_create_network = false
  deletion_policy     = var.deletion_policy
}

resource "google_project_service" "this" {
  for_each = var.services

  project            = google_project.this.project_id
  service            = each.value
  disable_on_destroy = false
}
