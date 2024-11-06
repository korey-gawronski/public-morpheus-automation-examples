# Subscription examples and related billing requirements
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription
variable "billing_account_name" {
  type        = string
  description = "Billing account ID/name"
}

variable "billing_profile_name" {
  type        = string
  description = "Billing profile ID/name"
}

variable "invoice_section_name" {
  type        = string
  description = "Invoice section ID/name"
}

variable "existing_subscription_id" {
  type        = string
  description = "Subscription ID is required by the provider, even when creating a subscription"
}

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

variable "subscription_owners_principal_ids" {
  type        = set(string)
  description = "Groups that contain the subscription owners that will be added, in addition to the app registration"
  default     = [ "5117be28-4e0e-4fb5-b141-c90396cf6f79" ]
}

variable "subscription_owners_principal_type" {
  type        = string
  description = "Should match the type of subscription_owners_principal_ids being supplied"
}

# morpheus_subscription_contributor_principal_id could be the same Service Principal used for Terraform auth (client_id/client_secret)
variable "morpheus_subscription_contributor_principal_id" {
  type        = string
  description = "Principal that should be added as a Contributor - used for adding Clouds into Morpheus.  Usually the object ID from the Enterprise Application (Service Principal)"
}

variable "morpheus_subscription_contributor_principal_type" {
  type        = string
  description = "Should match the type of morpheus_subscription_contributor_principal_id being supplied"
}

# Inputs that might not be saved in a TFVARS
variable "new_subscription_name" {
  type        = string
  description = "Subscription name, possibly a customer name"
}