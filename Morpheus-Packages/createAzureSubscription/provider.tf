terraform {
  required_version = ">= 1.5.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }
}

# Default provider unless the "provider" argument is used in a resource
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {
    subscription {
      prevent_cancellation_on_destroy = false
    }
  }
  environment   = "public"
  client_id     = var.client_id
  tenant_id     = var.tenant_id
  client_secret = var.client_secret
  # Required when creating a subscription, even though it won't be used
  subscription_id = var.existing_subscription_id
}