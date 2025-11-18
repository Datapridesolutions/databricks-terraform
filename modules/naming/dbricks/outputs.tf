output "resource_group_dbricksws" {
  value = local.resource_group_names.dbricksws
}

output "resource_group_dbricksman" {
  value = local.resource_group_names.dbricksman
}

output "resource_group_network" {
  value = local.resource_group_names.network
}

output "databricks_workspace_dbricks" {
  value = module.databricks_workspace_dbricks_naming.name
}

output "storage_account_adls" {
  value = module.storage_account_adls_naming.name
}

output "access_connector_extstore" {
  value = module.access_connector_extstore_naming.name
}

output "private_endpoint_controlplane" {
  value = local.private_endpoint_names.controlplane
}

output "private_endpoint_webauth" {
  value = local.private_endpoint_names.webauth
}

output "private_endpoint_blob" {
  value = local.private_endpoint_names.blob
}

output "private_endpoint_dfs" {
  value = local.private_endpoint_names.dfs
}

output "resource_groups" {
  value = local.resource_group_names
}

output "network" {
  value = {
    virtual_network = local.vnet_name

    private_subnet = local.subnet_names.private
    private_nsg = local.nsg_names.private

    public_subnet = local.subnet_names.public
    public_nsg = local.nsg_names.public

    pep_subnet = local.subnet_names.pep
    pep_nsg = local.nsg_names.pep
  }
}

output "private_endpoints" {
  value = local.private_endpoint_names
}
