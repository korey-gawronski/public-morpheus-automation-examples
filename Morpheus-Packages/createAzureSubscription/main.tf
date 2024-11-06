# Subscription examples and related billing requirements
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription

# Used for Customer Accounts - only one "azurerm_billing_mca_account_scope" or "azurerm_billing_mpa_account_scope" should be used
data "azurerm_billing_mca_account_scope" "billing_account" {
  billing_account_name = var.billing_account_name
  billing_profile_name = var.billing_profile_name
  invoice_section_name = var.invoice_section_name
}

resource "azurerm_subscription" "new_subscription" {
  subscription_name = var.new_subscription_name
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billing_account.id
}

# Used for Partner Accounts - only one "azurerm_billing_mca_account_scope" or "azurerm_billing_mpa_account_scope" should be used
# data "azurerm_billing_mpa_account_scope" "billing_account" {
#   billing_account_name = var.billing_account_name
#   customer_name        = var.customer_name
# }

# resource "azurerm_subscription" "new_subscription" {
#   subscription_name = var.new_subscription_name
#   billing_scope_id  = data.azurerm_billing_mpa_account_scope.billing_account.id
# }

resource "azurerm_role_assignment" "assign_owner" {
  for_each             = var.subscription_owners_principal_ids
  scope                = "/subscriptions/${azurerm_subscription.new_subscription.subscription_id}"
  role_definition_name = "Owner"
  principal_id         = each.key
  principal_type       = var.subscription_owners_principal_type
}

resource "azurerm_role_assignment" "morpheus_assign_contributor" {
  scope                = "/subscriptions/${azurerm_subscription.new_subscription.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = var.morpheus_subscription_contributor_principal_id
  principal_type       = var.morpheus_subscription_contributor_principal_type
}