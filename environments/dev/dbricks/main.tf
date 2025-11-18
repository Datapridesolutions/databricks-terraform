terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.data_subscription_id
  resource_provider_registrations = "none"
}

module "dbricks" {
  source = "../../../modules/stacks/dbricks"
  
  environment = var.environment
  data_subscription_id = var.data_subscription_id
  network_settings = var.network_settings
}