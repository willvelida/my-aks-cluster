variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
}

variable "location" {
  description = "The location where the resources will be created."
}

variable "tags" {
    description = "A mapping of tags to assign to the resources."
    type = map(string)
}