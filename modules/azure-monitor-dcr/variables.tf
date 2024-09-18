variable "dcr_name" {
  type = string
  description = "Name of the Data Collection Rule"
}

variable "rg_name" {
  type = string
  description = "Name of the Resource Group"
}

variable "location" {
  type = string
  description = "Location of the Resource Group"
}

variable "dce_id" {
  type = string
  description = "ID of the Data Collection Endpoint"
}

variable "prometheus_id" {
  type = string
  description = "ID of the Prometheus Monitor Account"
}

variable "prometheus_name" {
  type = string
  description = "Name of the Prometheus Monitor Account"
}

variable "dcra_name" {
  type = string
  description = "Name of the Data Collection Rule Association"
}

variable "cluster_id" {
  type = string
  description = "ID of the AKS Cluster"
}