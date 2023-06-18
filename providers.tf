provider "google" {
  project = var.project_id
  zone  = var.zone
}

terraform {
  backend "gcs" {
    bucket = "round-bounty-363611-tfstate"
    prefix = "terraform/state"
  }
}
