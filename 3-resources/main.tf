module "storage_buckets" {
  for_each = var.storage_buckets
  source   = "../modules/storage"

  name               = each.value.name
  project_id         = each.value.project_id
  location           = each.value.location
  labels             = each.value.labels
  versioning_enabled = each.value.versioning_enabled
  force_destroy      = false
}
