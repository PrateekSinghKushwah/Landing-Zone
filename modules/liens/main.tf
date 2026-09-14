resource "google_resource_manager_lien" "this" {
  parent       = join("/", ["projects", var.project_id])
  restrictions = var.restrictions
  origin       = var.origin
  reason       = var.reason
}
