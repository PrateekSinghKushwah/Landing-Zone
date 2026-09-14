output "contact_names" {
  description = "Essential-contact resource names keyed by Terraform identifier."
  value       = { for key, contact in google_essential_contacts_contact.this : key => contact.name }
}
