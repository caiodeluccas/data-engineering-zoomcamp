variable "credentials" {
    description = "My Credential"
    default = "./keys/terraform-demo-503013-0bfa7cb61d15.json"
}


variable "bq_dataset_name" {
    description = "My BigQuery Dataset Name"
    default = "demo_dataset"
}

variable "location" {
    description = "Project Location"
    default = "southamerica-east1"
}

variable "region" {
    description = "Project Region"
    default = "southamerica-east1"
}

variable "zone" {
    description = "Project Zone"
    default = "southamerica-east1-a"
}

variable "gcs_bucket_name" {
    description = "My Storage Bucket Name"
    default = "terraform-demo-503013-terra-bucket"
}

variable "gcs_storage_class" {
    description = "Bucket Storage Class"
    default = "STANDERT"
}