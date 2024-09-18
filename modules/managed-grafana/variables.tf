variable "grafana_name" {
  description = "The name of the Grafana resource"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resources will be deployed"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
}

variable "workspace_id" {
  description = "The ID of the Azure Monitor workspace"
  type        = string
}