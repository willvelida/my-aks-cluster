resource "azurerm_user_assigned_identity" "msi" {
  location = var.location
  name = var.name
  resource_group_name = var.rg_name
}