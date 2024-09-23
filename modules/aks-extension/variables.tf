variable "ext_name" {
  type = string
  description = "The name of the AKS extension"
}

variable "cluster_id" {
  type = string
  description = "The ID of the AKS cluster to install the extension"
}

variable "extension_type" {
  type = string
  description = "The type of the extension"
}

variable "configuration_settings" {
  type = map
  description = "The configuration settings for the extension"
  default = {}
}