variable "aks_name" {
  description = "The name of the AKS cluster"
  type = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type = string
}

variable "rg_name" {
  description = "The name of the resource group in which the AKS cluster will be created."
  type = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type = number
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type = string
}

variable "identity_ids" {
  description = "The ID of the user-assigned managed identity"
  type = string
}

variable "tags" {
  description = "A mapping of tags to assign to the AKS cluster."
  type = map(string)
}

variable "username" {
  description = "The username for the AKS cluster"
  type = string
}

variable "ssh_public_key" {
  description = "The SSH public key to use for the AKS cluster"
}

variable "min_count" {
  description = "The minimum number of nodes in the AKS cluster"
  type = number
}

variable "max_count" {
  description = "The maximum number of nodes in the AKS cluster"
  type = number
}