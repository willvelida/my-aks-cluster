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

  backend "azurerm" {
    key = "terraform.tfstate"
    use_oidc = true
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  use_oidc = true
}

provider "github" {
  token = var.github_token
  owner = var.github_organization_target
}

provider "azuread" {
}

data "azurerm_client_config" "current" {}