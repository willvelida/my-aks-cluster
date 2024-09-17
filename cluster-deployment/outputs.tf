output "resource_group_name" {
  value = module.resource-group.name
}

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}