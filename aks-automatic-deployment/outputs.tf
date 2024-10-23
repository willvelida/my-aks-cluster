output "rg_name" {
  value = module.resource-group.name
}

output "aks_name" {
  value = module.aks_automatic.cluster_name
}

output "aks_json_output" {
  value = module.aks_automatic.aks_json_output
}