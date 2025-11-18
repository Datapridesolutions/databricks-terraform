terraform {
  required_version = ">= 1.0.0"
  required_providers {
    databricks = {
      source = "databricks/databricks"
      version = ">= 1.0.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

module "region_uksouth" {
  source = "../../utility/region_uksouth"
}
