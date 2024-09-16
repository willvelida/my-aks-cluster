terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "github" {
  token = var.github_token
  owner = var.github_organization_target
}

data "azurerm_client_config" "current" {}