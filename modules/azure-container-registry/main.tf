resource "azurerm_container_registry" "acr" {
  name = var.name
  location = var.location
  tags = var.tags
  resource_group_name = var.rg_name
  sku = var.sku
  admin_enabled = var.admin_enabled
  identity {
    type = "UserAssigned"
    identity_ids = [ var.user_assigned_identity_id ]
  }
}