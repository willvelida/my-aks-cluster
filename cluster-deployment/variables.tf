variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
}

variable "location" {
  description = "The location where the resources will be created."
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
}

variable "user_assigned_identity_name" {
  description = "The name of the user-assigned managed identity that's used by the AKS cluster"
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "admin_enabled" {
  description = "Enable admin user for the Azure Container Registry"
  type        = bool
  default     = false
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Standard"
}

variable "acr_pull_role_name" {
  type        = string
  description = "The name of the AcrPull role given to the user-assigned identity"
  default     = "AcrPull"
}

variable "network_contributor_role_name" {
  type        = string
  description = "The name of the Network Contributor role given to the user-assigned identity"
  default     = "Network Contributor"
}

variable "monitoring_data_reader_role_name" {
  type        = string
  description = "The name of the Monitoring Data Reader role given to the user-assigned identity"
  default     = "Monitoring Data Reader"
}

variable "grafana_admin_role_name" {
  type        = string
  description = "The name of the Grafana Admin role given to the user-assigned identity"
  default     = "Grafana Admin"
}

variable "aks_name" {
  type        = string
  description = "The name of the deployed AKS cluster"
}

variable "aks_username" {
  type        = string
  description = "The username for the AKS cluster"
}

variable "vm_size" {
  type        = string
  description = "The size of the Virtual Machine"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the AKS cluster"
  default     = 3
}

variable "azure_monitor_workspace_name" {
  type        = string
  description = "The name of the Azure Monitor Workspace"
}

variable "grafana_name" {
  type        = string
  description = "The name of the Grafana resource"
}

variable "azure_object_id" {
  type        = string
  description = "The Azure Object ID of the user to grant Grafana admin rights"
}

variable "dapr_extension_name" {
  type        = string
  description = "The name of the Dapr extension"
  default     = "dapr"
}

variable "dapr_extension_type" {
  default     = "Microsoft.Dapr"
  type        = string
  description = "The type of the Dapr extension"
}

variable "min_count" {
  type        = number
  description = "The minimum number of nodes in the AKS cluster"
  default     = 1
}

variable "max_count" {
  type        = number
  description = "The maximum number of nodes in the AKS cluster"
  default     = 5
}

variable "enable_azure_policy" {
  description = "Should Azure Policy be enabled for this cluster?"
  type        = bool
}