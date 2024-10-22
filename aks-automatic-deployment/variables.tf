variable "resource_group_name" {
  description = "The name of the Resource Group"
  type = string
}

variable "location" {
  description = "Where all resources will be deployed"
  type = string
}

variable "tags" {
  description = "The tags that will be applied to all resources"
  type = map(string)
}

variable "workspace_name" {
  description = "The name of the Log Analytics workspace"
  type = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS Automatic Cluster"
  type = string
}

variable "azure_object_id" {
  description = "The Object Id of the current user who will need Admin access to the cluster"
  type = string
}

variable "azure_monitor_workspace_name" {
  description = "The name of the Azure Monitor workspace"
  type = string
}

variable "grafana_name" {
  description = "The name of the Managed Grafana instance"
  type = string
}

variable "monitoring_data_reader_role_name" {
  description = "The name of the Monitoring Data Reader role"
  type = string
  default     = "Monitoring Data Reader"
}

variable "grafana_admin_role_name" {
  description = "The name of the Grafana Admin role"
  type = string
  default     = "Grafana Admin"
}

variable "azure_object_id" {
  description = "The Object Id of the current user who will need Admin access to the cluster"
  type = string
}