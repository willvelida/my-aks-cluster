resource "azurerm_log_analytics_workspace" "law" {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
  name = var.workspace_name
  sku = "PerGB2018"
  retention_in_days = 30
}