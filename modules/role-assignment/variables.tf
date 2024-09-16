variable "principal_id" {
  type = string
  description = "The Principal Id to assign this role to"
}

variable "principal_type" {
  type = string
  description = "The Principal Type of this role"
  default = "ServicePrincipal"
}

variable "role_name" {
  type = string
  description = "The Role Definition Name that this Role Assignment will use"
}

variable "scope_id" {
  type = string
  description = "The Id of the resource that this Role Assignment will be scoped to"
}