resource "google_essential_contacts_contact" "this" {
  for_each = var.contacts

  parent                              = format("organizations/%s", var.organization_id)
  email                               = each.value.email
  notification_category_subscriptions = each.value.notification_categories
  language_tag                        = each.value.language_tag
}
