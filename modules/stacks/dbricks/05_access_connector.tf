resource "azurerm_databricks_access_connector" "this" {
  name                = module.dbricks_names.access_connector_extstore
  resource_group_name = azurerm_resource_group.dbricksws.name
  location            = module.region_uksouth.region.location

  identity {
    type = "SystemAssigned"
  }

  tags = {}
}
