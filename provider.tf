# Configure the Google provider
# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project_id
  region  = var.region
}

# Configure the Terraform backend to store the state in a Google Cloud Storage bucket
# https://www.terraform.io/language/settings/backends/gcs
terraform {
  # backend "gcs" {
  #   bucket = "your-bucket-name"
  #   prefix = "terraform/state"
  # }

  # Require the Google provider
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
