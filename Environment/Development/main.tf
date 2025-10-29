module "raw_workspace" {
  source = "../../modules/workspace"
  workspace_name                  = "db-uks-d-databricks-raw"
  resource_group_name             = data.azurerm_resource_group.rg_databricks.name
  location                        = var.location
  vnet_id                         = data.azurerm_virtual_network.vnet_databricks.id
  private_subnet_name             = "snet-uks-10.20.2.0_24-databricks-private"
  public_subnet_name              = "snet-uks-10.20.1.0_24-databricks-public"
  private_nsg_association_id      = module.network.private_nsg_id
  public_nsg_association_id       = module.network.public_nsg_id
  tags                            = local.tags
}

module "silver_workspace" {
  source = "../../modules/workspace"
  workspace_name                  = "db-uks-d-databricks-silver"
  resource_group_name             = data.azurerm_resource_group.rg_databricks.name
  location                        = var.location
  vnet_id                         = data.azurerm_virtual_network.vnet_databricks.id
  private_subnet_name             = "snet-uks-10.20.2.0_24-databricks-private"
  public_subnet_name              = "snet-uks-10.20.1.0_24-databricks-public"
  private_nsg_association_id      = module.network.private_nsg_id
  public_nsg_association_id       = module.network.public_nsg_id
  tags                            = local.tags
}

module "gold_workspace" {
  source = "../../modules/workspace"
  workspace_name                  = "db-uks-d-databricks-gold"
  resource_group_name             = data.azurerm_resource_group.rg_databricks.name
  location                        = var.location
  vnet_id                         = data.azurerm_virtual_network.vnet_databricks.id
  private_subnet_name             = "snet-uks-10.20.2.0_24-databricks-private"
  public_subnet_name              = "snet-uks-10.20.1.0_24-databricks-public"
  private_nsg_association_id      = module.network.private_nsg_id
  public_nsg_association_id       = module.network.public_nsg_id
  tags                            = local.tags
}

module "access_connector" {
  source              = "../../modules/access_connector"
  name                = "dbac-uks-d-extstore-dev"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
}

module "private_endpoints" {
  source                  = "../../modules/endpoints"
  workspace_ids           = [
    module.raw_workspace.workspace_id,
    module.silver_workspace.workspace_id,
    module.gold_workspace.workspace_id
  ]
  managed_rg_ids          = [
    module.raw_workspace.managed_resource_group_id,
    module.silver_workspace.managed_resource_group_id,
    module.gold_workspace.managed_resource_group_id
  ]
  storage_account_names   = ["stuksdevdb001", "stuksdevdb001", "stuksdevdb001"]
  subnet_id               = module.network.pep_subnet_id
  dns_zone_ids            = {
    databricks = local.private_dns_zone_azuredatabricks
    blob       = local.private_dns_zone_blob
    dfs        = local.private_dns_zone_dfs
  }
}

module "unity_catalog" {
  source                = "../../modules/unity_catalog"
  metastore_name        = "uc-metastore-dev"
  region                = var.location
  storage_root_url      = "abfss://metastore@stuksdevdb001.dfs.core.windows.net/"
  access_connector_id   = module.access_connector.id
  workspace_ids         = [
    module.raw_workspace.workspace_id,
    module.silver_workspace.workspace_id,
    module.gold_workspace.workspace_id
  ]
  external_locations = {
    raw    = "abfss://raw@stuksdevdb001.dfs.core.windows.net/"
    silver = "abfss://silver@stuksdevdb001.dfs.core.windows.net/"
    gold   = "abfss://gold@stuksdevdb001.dfs.core.windows.net/"
  }
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
  location            = var.location
  vnet_name           = data.azurerm_virtual_network.vnet_databricks.name
}
