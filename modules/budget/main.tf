resource "google_billing_budget" "this" {
  billing_account = join("/", ["billingAccounts", var.billing_account_id])
  display_name    = var.display_name

  amount {
    specified_amount {
      currency_code = var.currency_code
      units         = tostring(var.amount)
    }
  }

  budget_filter {
    projects = var.projects
  }

  dynamic "threshold_rules" {
    for_each = var.threshold_percentages

    content {
      threshold_percent = threshold_rules.value
    }
  }

  all_updates_rule {
    disable_default_iam_recipients   = var.disable_default_iam_recipients
    monitoring_notification_channels = var.monitoring_notification_channels
  }
}
