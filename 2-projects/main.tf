module "projects" {
  for_each = var.projects
  source   = "../modules/projects"

  project_id         = each.value.project_id
  name               = each.value.name
  folder_id          = each.value.folder_id
  billing_account_id = each.value.billing_account_id
  services           = each.value.services
  labels             = each.value.labels
  deletion_policy    = each.value.deletion_policy
}
