resource "databricks_storage_credential" "uc_credential" {
  name = "uc-storage-cred"

  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.raw.id
  }

  comment = "Credential for Unity Catalog access to raw zone"
}
