module "resource-group" {
  source   = "../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Create User Assigned Managed Identity
module "user_assigned_identity" {
  source   = "../modules/user-assigned-identity"
  name     = var.user_assigned_identity_name
  location = var.location
  rg_name  = module.resource-group.name
  tags     = var.tags
}

module "acr" {
  source                    = "../modules/azure-container-registry"
  name                      = var.acr_name
  location                  = var.location
  rg_name                   = module.resource-group.name
  tags                      = var.tags
  user_assigned_identity_id = module.user_assigned_identity.user_assinged_identity_id
  admin_enabled             = var.admin_enabled
  sku                       = var.sku
}

module "acr_pull_role" {
  source       = "../modules/role-assignment"
  principal_id = module.user_assigned_identity.user_assinged_identity_principal_id
  role_name    = var.acr_pull_role_name
  scope_id     = module.acr.acr_id
}

module "network_contributor_role" {
  source       = "../modules/role-assignment"
  principal_id = module.user_assigned_identity.user_assinged_identity_principal_id
  role_name    = var.network_contributor_role_name
  scope_id     = module.resource-group.id
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

module "ssh-key" {
  source                  = "../modules/ssh-key"
  resource_group_location = module.resource-group.location
  resource_group_id       = module.resource-group.id
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

module "aks" {
  source              = "../modules/aks-cluster"
  rg_name             = module.resource-group.name
  location            = module.resource-group.location
  tags                = var.tags
  username            = var.aks_username
  ssh_public_key      = module.ssh-key.key_data
  vm_size             = var.vm_size
  node_count          = var.node_count
  identity_ids        = module.user_assigned_identity.user_assinged_identity_id
  aks_name            = var.aks_name
  min_count           = var.min_count
  max_count           = var.max_count
  enable_azure_policy = var.enable_azure_policy
}

module "dapr-extension" {
  source         = "../modules/aks-extension"
  extension_type = var.dapr_extension_type
  cluster_id     = module.aks.aks_id
  ext_name       = var.dapr_extension_name
}

module "am-dce" {
  source   = "../modules/azure-monitor-dce"
  dce_name = substr("MSProm-${module.resource-group.location}-${var.aks_name}", 0, min(44, length("MSProm-${module.resource-group.location}-${var.aks_name}")))
  rg_name  = module.resource-group.name
  location = module.resource-group.location
}

module "am-dcr" {
  source          = "../modules/azure-monitor-dcr"
  dcr_name        = substr("MSProm-${module.resource-group.location}-${var.aks_name}", 0, min(44, length("MSProm-${module.resource-group.location}-${var.aks_name}")))
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
  cluster_name = var.aks_name
  workspace_id = module.azure-monitor-workspace.id
}