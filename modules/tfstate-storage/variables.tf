variable "storage_account_name" {
  type = string
  description = "The name of the storage account"
}

variable "location" {
  type = string
  description = "The location/region where the storage account should be created"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which to create the storage account"
}

variable "account_tier" {
  type = string
  description = "The Tier to use for this storage account"
}

variable "account_replication_type" {
  type = string
  description = "The Replication Type to use for this storage account"
}

variable "container_name" {
  type = string
  description = "The name of the storage container"
}

variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the resource"
}