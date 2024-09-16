variable "location" {
  description = "The location where the user-assigned managed identity will be created."
  type = string
}

variable "name" {
  description = "The name of the user-assigned managed identity."
  type  = string
}

variable "rg_name" {
  description = "The name of the resource group in which the user-assigned managed identity will be created."
  type = string
}

variable "tags" {
  description = "value of tags to assign to the user-assigned managed identity."
  type = map(string)
}