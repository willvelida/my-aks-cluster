variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "location" {
  description = "The region where the Log Analytics workspace will be deployed"
  type = string
}

variable "tags" {
  description = "The tags that will be applied to the Log Analytics workspace"
  type = map(string)
}

variable "workspace_name" {
  description = "The name of the deployed Log Analytics workspace"
  type = string
}