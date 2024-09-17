resource "azurerm_monitor_workspace" "workspace" {
  name = var.name
  resource_group_name = var.rg_name
  location = var.location
  tags = var.tags
}