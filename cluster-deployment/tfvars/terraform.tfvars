resource_group_name = "rg-velidaaks"
location = "australiaeast"
tags = {
  environment = "dev"
  owner = "willvelida"
  application = "velidaaks"
  location = "australiaeast"
}
user_assigned_identity_name = "dev-uai-velidaaks"
acr_name = "devacrvelidaaks"
vm_size = "Standard_D2s_v3"
aks_username = "willvelida"
aks_name = "dev-velidaaks"
azure_monitor_workspace_name = "dev-amw-velidaaks"
grafana_name = "dev-grafana-velidaaks"
enable_azure_policy = true