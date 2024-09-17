module "tf-resource-group" {
  source   = "../modules/resource-group"
  name     = var.tf_state_rg_name
  location = var.location
  tags     = var.tags
}

module "identity-resource-group" {
  source   = "../modules/resource-group"
  name     = var.identity_rg_name
  location = var.location
  tags     = var.tags
}

module "tf-state-storage" {
  source                   = "../modules/tfstate-storage"
  storage_account_name     = var.storage_account_name
  resource_group_name      = module.tf-resource-group.name
  location                 = var.location
  tags                     = var.tags
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  container_name           = var.container_name
}

module "gh_usi" {
  source   = "../modules/user-assigned-identity"
  name     = "${var.gh_uai_name}-${var.environment}"
  location = var.location
  rg_name  = module.identity-resource-group.name
  tags     = var.tags
}

module "gh_federated_credential" {
  source                             = "../modules/federated-identity-credential"
  federated_identity_credential_name = "${var.github_organization_target}-${var.github_repository}-${var.environment}"
  rg_name                            = module.identity-resource-group.name
  user_assigned_identity_id          = module.gh_usi.user_assinged_identity_id
  subject                            = "repo:${var.github_organization_target}/${var.github_repository}:environment:${var.environment}"
  audience_name                      = local.default_audience_name
  issuer_url                         = local.github_issuer_url
}

module "tfstate_role_assignment" {
  source       = "../modules/role-assignment"
  principal_id = module.gh_usi.user_assinged_identity_principal_id
  role_name    = "Storage Blob Data Contributor"
  scope_id     = module.tf-state-storage.id
}

