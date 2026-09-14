resource "google_tags_tag_key" "this" {
  parent      = format("organizations/%s", var.organization_id)
  short_name  = var.short_name
  description = var.description
}

resource "google_tags_tag_value" "this" {
  for_each = var.values

  parent      = google_tags_tag_key.this.name
  short_name  = each.value.short_name
  description = each.value.description
}
