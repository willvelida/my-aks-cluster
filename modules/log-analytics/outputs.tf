output "resource_id" {
  value = azurerm_log_analytics_workspace.law.id
  description = "The ResourceId of the Log Analytics workspace"
}

output "name" {
  value = azurerm_log_analytics_workspace.law.name
  description = "The name of the Log Analytics workspace"
}