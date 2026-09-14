# GCP Terraform landing zone

This repository uses layered Terraform root modules for a Google Cloud organization:

- 0-bootstrap creates the remote-state bucket.
- 1-folders creates the organization hierarchy.
- 2-projects provisions projects and enables APIs.
- 3-resources deploys shared resources.
- 4-org-policies applies organization policy.
- 5-essential-contacts configures organization notifications.
- 6-budget-alerts creates billing-account budget controls.
- modules contains small, composable Terraform modules used by the layers.

Apply layers in numeric order. Each numbered directory is an independent Terraform
state and has its own GCS backend configuration sample. Copy its
backend.hcl.example to backend.hcl and its terraform.tfvars.example to
terraform.tfvars, then replace every example value before running Terraform.

Bootstrap is intentionally local-state first: initialize and apply
0-bootstrap before configuring the GCS backends in the remaining layers. Commit
Terraform lock files, but never commit state, credentials, backend.hcl, or real
tfvars files.

Authentication is supplied outside the repository, for example through
Application Default Credentials, workload identity federation, or provider
impersonation. Use least-privilege service accounts and a separate state prefix
for every layer and environment.
