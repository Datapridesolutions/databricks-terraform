terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.30.0"
    }
  }
}

resource "databricks_metastore" "this" {
  name   = var.metastore_name
  region = var.region
  owner  = var.metastore_owner
}

resource "databricks_metastore_assignment" "assignments" {
  for_each         = toset(var.workspace_ids)
  workspace_id     = each.value
  metastore_id     = databricks_metastore.this.id
  default_catalog_name = "main"
}

resource "databricks_storage_credential" "access_connector" {
  name     = "access-connector"
  azure_managed_identity {
    access_connector_id = var.access_connector_id
  }
}

resource "databricks_external_location" "locations" {
  for_each = var.external_locations

  name            = each.key
  url             = each.value
  credential_name = databricks_storage_credential.access_connector.name
  comment         = "External location for ${each.key}"
}
