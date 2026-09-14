output "billing_account_id" {
  description = "Associated billing account ID."
  value       = google_billing_project_info.this.billing_account
}
