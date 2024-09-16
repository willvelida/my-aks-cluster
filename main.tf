module "resource-group" {
  source = "./modules/resource-group"
  name = var.resource_group_name
  location  = var.location
  tags = var.tags
}

module "user_assigned_identity" {
  source = "./modules/user-assigned-identity"
  name = var.user_assigned_identity_name
  location = var.location
  rg_name = module.resource-group.name
  tags = var.tags
}