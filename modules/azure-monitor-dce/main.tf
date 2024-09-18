resource "azurerm_monitor_data_collection_endpoint" "dce" {
  name = var.dce_name
  resource_group_name = var.rg_name
  location = var.location
  kind = "Linux"
}