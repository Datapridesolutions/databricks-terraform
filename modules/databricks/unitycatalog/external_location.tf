resource "databricks_external_location" "raw" {
  name            = "raw-zone"
  url             = "abfss://raw@stuksdevdb001.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.uc_credential.name
  comment         = "External location for raw data"
}

resource "databricks_external_location" "silver" {
  name            = "silver-zone"
  url             = "abfss://silver@stuksdevdb001.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.uc_credential.name
  comment         = "External location for silver data"
}

resource "databricks_external_location" "gold" {
  name            = "gold-zone"
  url             = "abfss://gold@stuksdevdb001.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.uc_credential.name
  comment         = "External location for gold data"
}
