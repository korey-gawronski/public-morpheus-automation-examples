variable "tenant_id" {
  type        = string
  description = "Entra ID tenant ID"
}

variable "client_id" {
  type        = string
  description = "Application Registration client ID"
}

variable "client_secret" {
  type        = string
  description = "Application Registration client secret"
  sensitive   = true
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID to create resources in"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_region" {
  type        = string
  description = "Region the resource group should be created in.  Example formats are 'East US 2' or 'eastus2'"
}