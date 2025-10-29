resource "databricks_metastore" "uc_metastore_raw" {
  name         = "uc-metastore"
  region       = "uksouth"
  storage_root = "abfss://metastore@stuksdevdb001.dfs.core.windows.net/"
}
