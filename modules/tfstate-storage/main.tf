resource "azurerm_storage_account" "account" {
  name = var.storage_account_name
  location = var.location
  resource_group_name = var.resource_group_name
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
  tags = var.tags
}

resource "azurerm_storage_container" "container" {
  name = var.container_name
  storage_account_name = azurerm_storage_account.account.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "automatic_container" {
  name = var.automatic_container_name
  storage_account_name = azurerm_storage_account.account.name
  container_access_type = "private"
}