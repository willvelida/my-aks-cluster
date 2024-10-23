module "resource-group" {
  source   = "../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "law" {
  source              = "../modules/log-analytics"
  location            = module.resource-group.location
  resource_group_name = module.resource-group.name
  tags                = var.tags
  workspace_name      = var.workspace_name
}

module "aks_automatic" {
  source                     = "../modules/aks-automatic-cluster"
  location                   = module.resource-group.location
  resource_group_id          = module.resource-group.id
  tags                       = var.tags
  log_analytics_workspace_id = module.law.resource_id
  aks_cluster_name           = var.aks_cluster_name
  current_object_id          = var.azure_object_id
}

module "azure-monitor-workspace" {
  source   = "../modules/azure-monitor-workspace"
  name     = var.azure_monitor_workspace_name
  rg_name  = module.resource-group.name
  location = module.resource-group.location
  tags     = var.tags
}

module "managed-grafana" {
  source       = "../modules/managed-grafana"
  grafana_name = var.grafana_name
  rg_name      = module.resource-group.name
  location     = module.resource-group.location
  tags         = var.tags
  workspace_id = module.azure-monitor-workspace.id
}

module "am-dce" {
  source   = "../modules/azure-monitor-dce"
  dce_name = substr("MSProm-${module.resource-group.location}-${var.aks_cluster_name}", 0, min(44, length("MSProm-${module.resource-group.location}-${var.aks_cluster_name}")))
  rg_name  = module.resource-group.name
  location = module.resource-group.location
}

module "am-dcr" {
  source          = "../modules/azure-monitor-dcr"
  dcr_name        = substr("MSProm-${module.resource-group.location}-${var.aks_cluster_name}", 0, min(44, length("MSProm-${module.resource-group.location}-${var.aks_cluster_name}")))
  rg_name         = module.resource-group.name
  location        = module.resource-group.location
  dce_id          = module.am-dce.id
  prometheus_id   = module.azure-monitor-workspace.id
  prometheus_name = module.azure-monitor-workspace.name
  dcra_name       = "dcra-dcr-prometheus-aks"
  cluster_id      = module.aks.aks_id
}

module "rule-groups" {
  source       = "../modules/azure-monitor-alert-prometheus-rule-group"
  rg_name      = module.resource-group.name
  location     = module.resource-group.location
  cluster_id   = module.aks.aks_id
  cluster_name = module.aks_automatic.cluster_name
  workspace_id = module.azure-monitor-workspace.id
}

module "monitoring_data_reader_role" {
  source       = "../modules/role-assignment"
  principal_id = module.managed-grafana.principal_id
  role_name    = var.monitoring_data_reader_role_name
  scope_id     = module.azure-monitor-workspace.id
}

module "grafana_admin_role" {
  source         = "../modules/role-assignment"
  principal_id   = var.azure_object_id
  role_name      = var.grafana_admin_role_name
  scope_id       = module.managed-grafana.id
  principal_type = "User"
}