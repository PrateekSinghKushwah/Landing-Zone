output "folder_ids" {
  description = "Folder IDs keyed by Terraform identifier."
  value       = { for key, folder in module.folders : key => folder.id }
}
