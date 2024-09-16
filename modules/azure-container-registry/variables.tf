variable "name" {
  description = "The name of the Container Registry"
  type = string
}

variable "location" {
  description = "The location where the resources will be created."
  type = string
}

variable "rg_name" {
  description = "The name of the resource group in which the resources will be created."
  type = string
}

variable "sku" {
  description = "The SKU of the Container Registry"
  type = string
}

variable "admin_enabled" {
  description = "Enable admin user for the Container Registry"
  type = bool
}

variable "user_assigned_identity_id" {
  description = "The ID of the user-assigned managed identity"
  type = string
}

variable "tags" {
    description = "A mapping of tags to assign to the resources."
    type = map(string)
}