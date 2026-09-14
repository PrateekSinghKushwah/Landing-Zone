output "project_id" {
  description = "Project ID."
  value       = google_project.this.project_id
}

output "project_number" {
  description = "Project number."
  value       = google_project.this.number
}
