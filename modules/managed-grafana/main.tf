resource "azurerm_dashboard_grafana" "grafana" {
  name = var.grafana_name
  resource_group_name = var.rg_name
  location = var.location
  tags = var.tags
  grafana_major_version = 10

  identity {
    type = "UserAssigned"
    identity_ids = [ var.identity_id ]
  }

  azure_monitor_workspace_integrations {
    resource_id = var.workspace_id
  }
}