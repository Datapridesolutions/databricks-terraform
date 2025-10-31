provider "azurerm" {
  features {}
  subscription_id = "70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485"
}


data "azurerm_resource_group" "rg_databricks" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet_databricks" {
  name                = "vnet-databricks-test"
  address_space       = ["10.10.0.0/16"]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
}

module "network" {
  source              = "../../modules/databricks/networks"
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
  location            = var.location
  vnet_name           = azurerm_virtual_network.vnet_databricks.name
  private_subnet_name = var.private_subnet_name_test
  public_subnet_name  = var.public_subnet_name_test
}

module "workspace" {
  source = "../../modules/databricks"
  workspace_name = var.workspace_name
  resource_group_name = data.azurerm_resource_group.rg_databricks.name
  location = var.location
  vnet_id = azurerm_virtual_network.vnet_databricks.id
  public_subnet_name = var.public_subnet_name_test
  private_subnet_name = var.private_subnet_name_test
  public_subnet_network_security_group_association_id = module.network.public_subnet_nsg_assoc_id
  private_subnet_network_security_group_association_id = module.network.private_subnet_nsg_assoc_id
  public_nsg_association_id  = module.network.public_nsg_id
  private_nsg_association_id = module.network.private_nsg_id
  public_network_access_enabled = true
  network_security_group_rules_required = "NoAzureDatabricksRules"
  customer_managed_key_enabled = true
  no_public_ip = true
  tags = local.tags
}

module "access_connector" {
  source                = "../../modules/databricks/privateendpoints"
  location              = var.location
  resource_group_name   = data.azurerm_resource_group.rg_databricks.name
  workspace_ids         = [module.workspace.workspace_id]
  managed_rg_ids        = [module.workspace.managed_resource_group_id]
  storage_account_names = ["stukstestdb001"]
  subnet_id             = module.network.pep_subnet_id
  dns_zone_ids = {
    databricks = local.private_dns_zone_azuredatabricks
    blob       = local.private_dns_zone_blob
    dfs        = local.private_dns_zone_dfs
  }
  depends_on_workspace = [module.workspace]
}
