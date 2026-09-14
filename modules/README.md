# Reusable modules

Each module has a narrowly scoped responsibility and no provider configuration.
Root modules own provider settings, backends, and deployment order.

| Module | Responsibility |
| --- | --- |
| billing | Link a project to a billing account |
| budget | Create a Cloud Billing budget and thresholds |
| folders | Create an organization folder |
| iam | Grant one non-authoritative organization IAM membership |
| labels | Build standard resource labels |
| liens | Protect a project with a resource-manager lien |
| org-policy | Apply one organization policy constraint |
| projects | Create a project and enable requested APIs |
| storage | Create a hardened Cloud Storage bucket |
| tags | Create a tag key and its tag values |
