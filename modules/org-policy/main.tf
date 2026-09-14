resource "google_org_policy_policy" "this" {
  parent = format("organizations/%s", var.organization_id)
  name   = var.constraint

  spec {
    rules {
      enforce = var.enforce
    }
  }
}
