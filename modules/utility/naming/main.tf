terraform {
  required_version = ">= 1.0"
}

locals {
  naming_patterns = {
    resource_group = "rg-${var.identifier}-${var.environment.code}-${var.region.code}-001"
    managed_identity = "id-${var.identifier}-${var.environment.code}-${var.region.code}-001"
    databricks_workspace = "db-${var.identifier}-${var.environment.code}-${var.region.code}-001"
    private_endpoint = "pep-${var.identifier}-${var.environment.code}-${var.region.code}-01"
    storage_account = "st${var.identifier}${var.environment.code}${var.region.code}01"
    databricks_access_connector = "dbac-${var.identifier}-${var.environment.code}-${var.region.code}-001"
  }
  
  resource_name = local.naming_patterns[var.resource_type]
}