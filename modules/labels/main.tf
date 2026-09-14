locals {
  labels = merge(
    {
      environment = var.environment
      managed-by  = var.managed_by
      cost-center = var.cost_center
    },
    var.additional_labels,
  )
}
