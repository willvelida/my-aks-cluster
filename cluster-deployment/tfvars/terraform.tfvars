resource_group_name = "rg-devsaaks"
location = "eastus"
tags = {
  environment = "prod"
  owner = "devs108"
  application = "devsaaks"
  location = "eastus"
  type = "k8s-lab"
}
user_assigned_identity_name = "prod-uai-devsaaks"
acr_name = "devaksacr"
vm_size = "Standard_D2s_v3"
aks_username = "devs108"
aks_name = "prod-devsaaks"
azure_monitor_workspace_name = "prod-amw-devs108"
grafana_name = "prod-grafana-devs108"
enable_azure_policy = true