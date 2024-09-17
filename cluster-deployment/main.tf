module "resource-group" {
  source   = "../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

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

module "ssh-key" {
  source                  = "../modules/ssh-key"
  resource_group_location = module.resource-group.location
  resource_group_id       = module.resource-group.id
}

module "aks" {
  source         = "../modules/aks-cluster"
  rg_name        = module.resource-group.name
  location       = module.resource-group.location
  tags           = var.tags
  username       = var.aks_username
  ssh_public_key = module.ssh-key.key_data
  vm_size        = var.vm_size
  node_count     = var.node_count
  identity_ids   = module.user_assigned_identity.user_assinged_identity_id
  aks_name       = var.aks_name
}