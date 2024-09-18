variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type = string
}

variable "location" {
  description = "The location of the resource group"
  type = string
}

variable "workspace_id" {
  description = "The ID of the Log Analytics workspace"
  type = string
}

variable "cluster_id" {
  description = "The ID of the AKS cluster"
  type = string  
}