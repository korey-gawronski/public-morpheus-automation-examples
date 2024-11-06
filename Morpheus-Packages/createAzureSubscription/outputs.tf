output "subscription_name" {
  value = azurerm_subscription.new_subscription.subscription_name
}

output "subscription_id" {
  value = azurerm_subscription.new_subscription.subscription_id
}

output "subscription_tenant_id" {
  value = azurerm_subscription.new_subscription.tenant_id
}