resource "azurerm_monitor_data_collection_rule" "dcr" {
  name = var.dcr_name
  resource_group_name = var.rg_name
  location = var.location
  data_collection_endpoint_id = var.dce_id
  kind = "Linux"
  description = "DCR for Azure Monitor Metrics Profile (Managed Prometheus)"

  data_sources {
    prometheus_forwarder {
      name = "PrometheusDataSource"
      streams = [ "Microsoft-PrometheusMetrics" ]
    }
  }

  destinations {
    monitor_account {
      monitor_account_id = var.prometheus_id
      name = var.prometheus_name
    }
  }

  data_flow {
    streams = [ "Microsoft-PrometheusMetrics" ]
    destinations = [ var.prometheus_name ]
  }
}

resource "azurerm_monitor_data_collection_rule_association" "dcra" {
  name = var.dcra_name
  target_resource_id = var.cluster_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
  description = "Association of DCR. Deleting this association will break the data collection for this AKS Cluster"
}