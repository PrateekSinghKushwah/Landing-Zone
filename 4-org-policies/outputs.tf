output "policy_names" {
  description = "Organization policy names keyed by Terraform identifier."
  value       = { for key, policy in module.org_policies : key => policy.name }
}
