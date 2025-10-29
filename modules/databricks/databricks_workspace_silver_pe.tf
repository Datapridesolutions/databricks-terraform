
resource "azurerm_databricks_workspace" "silver" {
  name                = "db-uks-d-databricks-silver"
  location            = var.location
  resource_group_name = azurerm_resource_group.databricks_rg.name
  sku                 = var.sku

  managed_resource_group_name = "db-uks-d-databricks-silver-managed"

  custom_parameters {
    no_public_ip        = true
    virtual_network_id  = var.vnet_id
    public_subnet_name  = var.subnet_public
    private_subnet_name = var.subnet_private
    prepare_encryption  = true
  }

  tags = {
    application             = "databricks"
    databricks-environment = "true"
  }
}
