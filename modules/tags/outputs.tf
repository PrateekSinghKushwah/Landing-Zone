output "tag_key_name" {
  description = "Fully qualified tag key name."
  value       = google_tags_tag_key.this.name
}

output "tag_value_names" {
  description = "Tag values keyed by Terraform identifier."
  value       = { for key, tag_value in google_tags_tag_value.this : key => tag_value.name }
}
