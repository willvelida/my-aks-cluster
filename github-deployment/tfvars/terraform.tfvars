gh_uai_name                = "uai-olafkfreund-github"
github_organization_target = "olafkfreund"
container_name             = "tfstate"
storage_account_name       = "freunddevtfstate"
tf_state_rg_name           = "rg-uks-fcaks-tfstate"
identity_rg_name           = "rg-fcaks-identity"
location                   = "uksouth"
tags = {
  environment = "dev"
  owner       = "olafkfreund"
}
