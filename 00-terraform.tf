terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.36.0"
    }
  }
}

provider "google" {
  credentials = file(var.credential)

  project = var.project
  region  = "asia-southeast2"
  zone    = "asia-southeast2-a"
}
