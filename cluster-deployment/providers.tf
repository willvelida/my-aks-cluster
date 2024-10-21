terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6"
    }
    azapi = {
      source  = "azure/azapi"
      version = "2.0.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
  }

  backend "azurerm" {
    key      = "terraform.tfstate"
    use_oidc = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azapi" {
  use_oidc = true
}

provider "azuread" {
}

data "azurerm_client_config" "current" {}