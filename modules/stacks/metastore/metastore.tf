resource "databricks_metastore" "metastore" {
  name = var.metastore_name
  region = module.region_uksouth.region.databricks_region
  owner = var.metastore_owner
}

resource "databricks_storage_credential" "access_connectors" {
  for_each = var.access_connectors
  
  name = each.value.name
  metastore_id = databricks_metastore.metastore.id
  comment = each.value.comment
  azure_managed_identity {
    access_connector_id = each.value.id
  }
}
