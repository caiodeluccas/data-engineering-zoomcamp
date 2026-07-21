terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.40.0"
    }
  }
}

provider "google" {
  #Credencials can be hard codded like this, or use gcloud or export google credentials (export GOOGLE_CREDENTIALS = 'directory of the keys' on terminal).
  credentials = file(var.credentials)
  project = "terraform-demo-503013"
  region  = var.region
  zone    = var.zone
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = "demo_dataset"
  location                    = var.location
}
