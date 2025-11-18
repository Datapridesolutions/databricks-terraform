resource "azurerm_resource_group" "dbricksws" {
  name     = module.dbricks_names.resource_group_dbricksws
  location = module.region_uksouth.region.location
}

resource "azurerm_resource_group" "network" {
  name     = module.dbricks_names.resource_group_network
  location = module.region_uksouth.region.location
}
