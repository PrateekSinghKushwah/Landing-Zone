output "id" {
  description = "Numeric folder ID."
  value       = google_folder.this.folder_id
}

output "name" {
  description = "Fully qualified folder name."
  value       = google_folder.this.name
}
