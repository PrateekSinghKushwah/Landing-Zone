module "budgets" {
  for_each = var.budgets
  source   = "../modules/budget"

  billing_account_id               = var.billing_account_id
  display_name                     = each.value.display_name
  amount                           = each.value.amount
  currency_code                    = each.value.currency_code
  projects                         = each.value.projects
  threshold_percentages            = each.value.threshold_percentages
  monitoring_notification_channels = each.value.monitoring_notification_channels
  disable_default_iam_recipients   = each.value.disable_default_iam_recipients
}
