terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.data_subscription_id
  resource_provider_registrations = "none"
  features {}
}

module "bootstrap" {
  source = "../../../modules/stacks/bootstrap"
  
  environments = var.environments
  data_subscription_id = var.data_subscription_id
}