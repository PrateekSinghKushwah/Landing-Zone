# 0-bootstrap

Creates the versioned, non-public bucket used by the other layers for remote
Terraform state. After the first local apply, this layer migrates its own state
to gs://vaulted-backend/landing-zone/0-bootstrap. Configure the GCS backends in
layers 1 through 6 only after this migration succeeds.

It also creates the Terraform automation service account and grants
roles/iam.serviceAccountTokenCreator only to the principals listed in
impersonation_principals. Populate that set with a tightly controlled group or
workload-identity principal; do not grant impersonation to all users.
