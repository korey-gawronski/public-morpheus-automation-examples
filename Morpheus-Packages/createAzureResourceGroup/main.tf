resource "azurerm_resource_group" "new_rg" {
  name     = var.resource_group_name
  location = var.resource_group_region
}