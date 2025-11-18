resource "azurerm_databricks_workspace" "this" {
  name = module.dbricks_names.databricks_workspace_dbricks
  resource_group_name = azurerm_resource_group.dbricksws.name
  location = module.region_uksouth.region.location
  sku = "premium"
  managed_resource_group_name = module.dbricks_names.resource_group_dbricksman
  
  custom_parameters {
    virtual_network_id = azurerm_virtual_network.this.id
    public_subnet_name = azurerm_subnet.public.name
    private_subnet_name = azurerm_subnet.private.name
    public_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.public_nsg_assoc.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private_nsg_assoc.id
    no_public_ip = true
    }
}
