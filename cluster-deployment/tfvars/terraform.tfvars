resource_group_name = "rg-uks-dev-fcaks-rg"
location            = "uksouth"
tags = {
  environment = "dev"
  owner       = "olafkfreund"
  application = "freundcloud-aks"
}
user_assigned_identity_name  = "uai-olafkfreund-github-dev"
acr_name                     = "devfcacr"
vm_size                      = "Standard_D2s_v3"
aks_username                 = "olafkfreund"
aks_name                     = "dev-freundcloudaks"
azure_monitor_workspace_name = "dev-amw-freundcloudaks"
grafana_name                 = "dev-grafana-freundcloudaks"
