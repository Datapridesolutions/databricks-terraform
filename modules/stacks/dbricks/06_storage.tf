resource "azurerm_storage_account" "adls" {
  name                     = module.dbricks_names.storage_account_adls
  resource_group_name      = azurerm_resource_group.dbricksws.name
  location                 = module.region_uksouth.region.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
  tags                     = {}
}

resource "databricks_storage_credential" "metastore" {
  name = "metastore-credential-insightglobal"
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.this.id
  }
  comment = "Credential for Unity Catalog external location"
}

resource "azurerm_storage_container" "metastore" {
  name                  = "metastore"
  storage_account_id    = azurerm_storage_account.adls.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "storage_account_access" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = "94b4d6e2-7e44-4420-a5cb-1bb81b2d0664"
}

resource "azurerm_role_assignment" "container_access" {
  scope                = "${azurerm_storage_account.adls.id}/blobServices/default/containers/metastore"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = "94b4d6e2-7e44-4420-a5cb-1bb81b2d0664"
}

resource "databricks_external_location" "metastore" {
  name            = "metastore"
  url             = "abfss://metastore@${azurerm_storage_account.adls.name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.metastore.name
  comment         = "External location for Unity Catalog metastore"
}
