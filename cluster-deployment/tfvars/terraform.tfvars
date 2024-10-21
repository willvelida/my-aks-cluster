resource_group_name = "rg-freundcloudaks"
location            = "uksouth"
tags = {
  environment = "dev"
  owner       = "olafkfreund"
  application = "freundcloudaks"
}
user_assigned_identity_name  = "uai-olafkfreund-dev"
acr_name                     = "devfcacr"
vm_size                      = "Standard_D2s_v3"
aks_username                 = "olafkfreund"
aks_name                     = "freundcloudaks"
azure_monitor_workspace_name = "dev-amw-freundcloudaks"
grafana_name                 = "dev-grafana-fcaks"
