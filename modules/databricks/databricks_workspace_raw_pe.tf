resource "azurerm_databricks-dev-uks-01-workspace" "raw" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = azurerm_resource_group.databricks_rg.name
  sku                 = var.sku
  managed_resource_group_name = "${var.workspace_name}-managed"

  public_network_access_enabled         = false
  network_security_group_rules_required = "NoAzureDatabricksRules"
  customer_managed_key_enabled          = true

  custom_parameters {
    no_public_ip        = true
    virtual_network_id  = var.vnet_id
    public_subnet_name  = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    prepare_encryption  = true
  }

  tags = local.tags

  depends_on = [
    azurerm_subnet_network_security_group_association.public_subnet_association,
    azurerm_subnet_network_security_group_association.private_subnet_association
  ]
}
