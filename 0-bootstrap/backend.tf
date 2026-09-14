terraform {
  backend "gcs" {
    bucket = "vaulted-backend"
    prefix = "landing-zone/0-bootstrap"
  }
}
