output "member" {
  description = "Principal granted access."
  value       = google_organization_iam_member.this.member
}
