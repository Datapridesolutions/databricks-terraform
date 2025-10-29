-- Control Pane
resource "azurerm_private_endpoint" "pep_control_plane" {
  name                = "pep-databricks-dev-uks-01-control-plane"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.databricks_pep_snet.id

  private_service_connection {
    name                           = "psc-databricks-dev-uks-01-control-plane"
    private_connection_resource_id = azurerm_databricks_workspace.raw.id
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [local.private_dns_zone_azuredatabricks]
  }
}



--- Web Authentication ---
resource "azurerm_private_endpoint" "pep_webauth" {
  name                = "pep-databricks-dev-uks-01-webauth"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.databricks_pep_snet.id

  private_service_connection {
    name                           = "psc-databricks-dev-uks-01-webauth"
    private_connection_resource_id = azurerm_databricks_workspace.raw.id
    is_manual_connection           = false
    subresource_names              = ["browser_authentication"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [local.private_dns_zone_azuredatabricks]
  }
}


---Blob storage ---
resource "azurerm_private_endpoint" "pep_blob" {
  name                = "pep-databricks-dev-uks-01-blob"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.databricks_pep_snet.id

  private_service_connection {
    name                           = "psc-databricks-dev-uks-01-blob"
    private_connection_resource_id = join("", [azurerm_databricks_workspace.raw.managed_resource_group_id, "/providers/Microsoft.Storage/storageAccounts/stdatabricksdevuks01"])
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [local.private_dns_zone_blob]
  }
}



----DFS Storage ---
resource "azurerm_private_endpoint" "pep_dfs" {
  name                = "pep-databricks-dev-uks-01-dfs"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.databricks_pep_snet.id

  private_service_connection {
    name                           = "psc-databricks-dev-uks-01-dfs"
    private_connection_resource_id = join("", [azurerm_databricks_workspace.raw.managed_resource_group_id, "/providers/Microsoft.Storage/storageAccounts/stdatabricksdevuks01"])
    is_manual_connection           = false
    subresource_names              = ["dfs"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [local.private_dns_zone_dfs]
  }
}
