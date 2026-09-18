resource "random_id" "project_id" {
  count =var.project_id == null && var.project_id_prefix != null ? 1 : 0
  byte_length = 2
  
}

locals{
  project_id = var.project_id != null ? var.project_id : (
    var.project_id_prefix != null ? "${var.project_id_prefix}-${random_id.project_id[0].hex}" : null
  )
}
resource "google_project" "this" {
  project_id          = locals.project_id
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

lifecycle {
    precondition {
      condition     = var.project_id != null || var.project_id_prefix != null
      error_message = "Either project_id or project_id_prefix must be provided."
    }
  }

