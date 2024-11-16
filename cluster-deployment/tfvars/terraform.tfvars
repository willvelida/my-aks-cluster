resource_group_name = "rg-velidaaks"
location = "australiaeast"
tags = {
  environment = "prod"
  owner = "willvelida"
  application = "velidaaks"
  location = "australiaeast"
  sub = "MVP-sub"
  type = "POC"
}
user_assigned_identity_name = "prod-uai-velidaaks"
acr_name = "prodacrvelidaaks"
vm_size = "Standard_D2s_v3"
aks_username = "willvelida"
aks_name = "prod-velidaaks"
azure_monitor_workspace_name = "prod-amw-velidaaks"
grafana_name = "prod-grafana-velidaaks"
enable_azure_policy = true