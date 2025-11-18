terraform {
  required_version = ">= 1.0"
}

# Resource Groups Naming
module "resource_group_dbricksws_naming" {
  source      = "../../utility/naming"
  identifier  = "dbricksws"
  environment = var.environment
  region      = var.region
  resource_type = "resource_group"
}

module "resource_group_dbricksman_naming" {
  source      = "../../utility/naming"
  identifier  = "dbricksman"
  environment = var.environment
  region      = var.region
  resource_type = "resource_group"
}

# Databricks Workspace Naming
module "databricks_workspace_dbricks_naming" {
  source      = "../../utility/naming"
  identifier  = "dbricks"
  environment = var.environment
  region      = var.region
  resource_type = "databricks_workspace"
}

# Private Endpoints Naming
module "private_endpoint_controlplane_naming" {
  source      = "../../utility/naming"
  identifier  = "dbrickscontrolplane"
  environment = var.environment
  region      = var.region
  resource_type = "private_endpoint"
}

module "private_endpoint_webauth_naming" {
  source      = "../../utility/naming"
  identifier  = "dbrickswebauth"
  environment = var.environment
  region      = var.region
  resource_type = "private_endpoint"
}

module "private_endpoint_blob_naming" {
  source      = "../../utility/naming"
  identifier  = "dbricksblob"
  environment = var.environment
  region      = var.region
  resource_type = "private_endpoint"
}

module "private_endpoint_dfs_naming" {
  source      = "../../utility/naming"
  identifier  = "dbricksdfs"
  environment = var.environment
  region      = var.region
  resource_type = "private_endpoint"
}

module "storage_account_adls_naming" {
  source      = "../../utility/naming"
  identifier  = "adls"
  environment = var.environment
  region      = var.region
  resource_type = "storage_account"
}

module "access_connector_extstore_naming" {
  source      = "../../utility/naming"
  identifier  = "extstore"
  environment = var.environment
  region      = var.region
  resource_type = "databricks_access_connector"
}

locals {
  resource_group_names = {
    dbricksws = module.resource_group_dbricksws_naming.name
    dbricksman = module.resource_group_dbricksman_naming.name
    network = "rg-${var.region.code}-${var.environment.code}-dbricks-network"
  }

  vnet_name = "vnet-${var.region.code}-webapps-${var.environment.code}-01"
  
  subnet_names = {
    private = "snet-${var.region.code}-${replace(var.network_settings.private_subnet_address_range, "/", "_")}-private"
    public = "snet-${var.region.code}-${replace(var.network_settings.public_subnet_address_range, "/", "_")}-public"
    pep = "snet-${var.region.code}-${replace(var.network_settings.pep_subnet_address_range, "/", "_")}-pep"
  }
  
  nsg_names = {
    private = "nsg-${var.region.code}-${replace(var.network_settings.private_subnet_address_range, "/", "_")}-private"
    public = "nsg-${var.region.code}-${replace(var.network_settings.public_subnet_address_range, "/", "_")}-public"
    pep = "nsg-${var.region.code}-${replace(var.network_settings.pep_subnet_address_range, "/", "_")}-pep"
  }

  private_endpoint_names = {
    controlplane = module.private_endpoint_controlplane_naming.name
    webauth      = module.private_endpoint_webauth_naming.name
    blob         = module.private_endpoint_blob_naming.name
    dfs          = module.private_endpoint_dfs_naming.name
  }
}
