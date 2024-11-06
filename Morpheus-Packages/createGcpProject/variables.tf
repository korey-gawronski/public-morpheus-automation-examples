### Project Variables
variable "project_name" {
  type        = string
  description = "Friendly Project name, can contain other special characters and spaces"
}

variable "project_id_prefix" {
  type        = string
  description = "Project ID prefix which should be void of special charactes and spaces.  This will be used to generate the project ID"
}

variable "auth" {
  type        = string
  description = "GCP authentication file or contents"
  sensitive   = true
}

variable "billing_account_id" {
  type        = string
  description = "Linked billing account for the Project"
}

variable "folder_id" {
  type        = string
  description = "Folder ID the project should be placed under.  Usually a numberic ID such, example: 435223835116"
}

variable "service_list" {
  description = "The list of apis necessary for the project to be added into Morpheus"
  type        = list(string)
  default = [
    "compute.googleapis.com",              # Compute Engine API
    "cloudresourcemanager.googleapis.com", # Cloud Resource Manager API
    "cloudbilling.googleapis.com",         # Cloud Billing API
    "iam.googleapis.com",                  # Identity and Access Management (IAM) API
    "bigquery.googleapis.com",             # BigQuery API
    "bigquerydatatransfer.googleapis.com", # BigQuery Data Transfer API
    "container.googleapis.com",            # Kubernetes Engine API
  ]
}