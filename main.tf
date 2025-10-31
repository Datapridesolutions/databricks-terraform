provider "azurerm" {
  features {}
  subscription_id = "70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485"
  }

resource "azurerm_resource_group" "databricks_rg" {
  name     = "rg-databricks-dev-uks-01"
  location = "uksouth"
}


resource "azurerm_resource_group" "databricks_rg_test" {
  name     = "rg-databricks-test-uks-01"
  location = "uksouth"
}


resource "azurerm_resource_group" "databricks_rg_prod" {
  name     = "rg-databricks-prod-uks-01"
  location = "uksouth"
}
