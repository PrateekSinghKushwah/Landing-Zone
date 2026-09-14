module "org_policies" {
  for_each = var.org_policies
  source   = "../modules/org-policy"

  organization_id = var.organization_id
  constraint      = each.value.constraint
  enforce         = each.value.enforce
}
