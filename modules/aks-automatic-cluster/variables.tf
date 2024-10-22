variable "resource_group_id" {
  description = "The resource id of the resource group"
  type = string
}

variable "location" {
  description = "The region to deploy the AKS Automatic Cluster"
  type = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS Automatic Cluster"
  type = string
}

variable "tags" {
  description = "The tags that will be applied to the AKS Automatic Cluster"
  type = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The resource id of the Log Analytics workspace that this cluster will use"
  type = string
}

variable "current_object_id" {
  description = "The Object Id of the current user who will need Admin access to the cluster"
}