output "project_ids" {
  description = "Project IDs keyed by Terraform identifier."
  value       = { for key, project in module.projects : key => project.project_id }
}

output "project_numbers" {
  description = "Project numbers keyed by Terraform identifier."
  value       = { for key, project in module.projects : key => project.project_number }
}
