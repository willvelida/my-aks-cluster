variable "federated_identity_credential_name" {
  type = string
  description = "value of the federated identity credential name"
}

variable "rg_name" {
  type = string
  description = "value of the resource group name"
}

variable "user_assigned_identity_id" {
  type = string
  description = "value of the user assigned identity id"
}

variable "subject" {
  type = string
  description = "value of the subject"
}

variable "audience_name" {
  type = string
  description = "value of the audience name"
}

variable "issuer_url" {
  type = string
  description = "value of the issuer url"
}