terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    databricks = {
      source = "databricks/databricks"
      version = ">= 1.0.0"
    }
  }
}

provider "databricks" {
  host = azurerm_databricks_workspace.this.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
}

module "region_uksouth" {
  source = "../../utility/region_uksouth"
}

module "dbricks_names" {
  source = "../../naming/dbricks"
  
  environment = var.environment
  region = module.region_uksouth.region
  network_settings = var.network_settings
}
