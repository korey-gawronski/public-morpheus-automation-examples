terraform {
  required_version = "= 1.5.5"
  required_providers {
    google = {
      version = "~> 5.16.0"
    }
  }
}

provider "google" {
  credentials = var.gcp_auth
}