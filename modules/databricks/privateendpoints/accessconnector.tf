
resource "azurerm_databricks_access_connector" "dev" {
  name                = "dbac-databricks-dev-uks-01"
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}
