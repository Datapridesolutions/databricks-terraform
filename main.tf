provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "databricks_rg" {
  name     = "rg-databricks-dev-uks-01"
  location = "uksouth"
}
