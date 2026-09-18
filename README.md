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

Bootstrap also creates the GitHub Actions Workload Identity Federation pool and
OIDC provider. Set `github_repository` in `0-bootstrap/terraform.tfvars` to the
repository's `OWNER/REPOSITORY` value, apply bootstrap, and use the resulting
`github_workload_identity_provider` output as the
`GCP_WORKLOAD_IDENTITY_PROVIDER` repository secret. Use the
`terraform_service_account_email` output as `GCP_SERVICE_ACCOUNT`.

Authentication is supplied outside the repository, for example through
Application Default Credentials, workload identity federation, or provider
impersonation. Use least-privilege service accounts and a separate state prefix
for every layer and environment.

## GitHub Actions

The `Terraform` workflow plans layers `1` through `6` for pushes and pull
requests. It applies only when a push targets `main`; pushes to other branches
skip apply after the plan completes. Bootstrap remains a manual, one-time step.

Configure these repository secrets before enabling the workflow:

- `GCP_WORKLOAD_IDENTITY_PROVIDER`
- `GCP_SERVICE_ACCOUNT`
- `TF_STATE_BUCKET`
- `TFVARS_FOLDERS`
- `TFVARS_PROJECTS`
- `TFVARS_RESOURCES`
- `TFVARS_ORG_POLICIES`
- `TFVARS_ESSENTIAL_CONTACTS`
- `TFVARS_BUDGET_ALERTS`

The `TFVARS_*` secrets should contain the complete contents of the matching
layer's `terraform.tfvars` file. The workload identity service account needs
permission to read and write the Terraform state bucket and manage the
resources in each layer.
