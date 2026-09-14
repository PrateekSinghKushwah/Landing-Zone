output "budget_names" {
  description = "Budget resource names keyed by Terraform identifier."
  value       = { for key, budget in module.budgets : key => budget.name }
}
