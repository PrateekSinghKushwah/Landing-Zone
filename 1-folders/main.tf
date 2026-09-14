module "folders" {
  for_each = var.folders
  source   = "../modules/folders"

  display_name = each.value.display_name
  parent = each.value.parent_id == null ? format("organizations/%s", var.organization_id) : format(
    "folders/%s",
    each.value.parent_id,
  )
}
