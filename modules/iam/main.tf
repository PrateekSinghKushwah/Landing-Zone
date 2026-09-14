resource "google_organization_iam_member" "this" {
  org_id = var.organization_id
  role   = var.role
  member = var.member
}
