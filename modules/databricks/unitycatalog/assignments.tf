resource "databricks_metastore_assignment" "raw" {
  workspace_id         = azurerm_databricks_workspace.raw.workspace_id
  metastore_id         = databricks_metastore.uc_metastore.id
  default_catalog_name = "main"
}

resource "databricks_metastore_assignment" "silver" {
  workspace_id         = azurerm_databricks_workspace.silver.workspace_id
  metastore_id         = databricks_metastore.uc_metastore.id
  default_catalog_name = "main"
}

resource "databricks_metastore_assignment" "gold" {
  workspace_id         = azurerm_databricks_workspace.gold.workspace_id
  metastore_id         = databricks_metastore.uc_metastore.id
  default_catalog_name = "main"
}
