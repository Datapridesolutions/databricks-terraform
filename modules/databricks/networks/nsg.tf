resource "azurerm_network_security_group" "databricks_nsg" {
  name                = "nsg-databricks-dev-uks-01"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "public_subnet_association" {
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.databricks_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "private_subnet_association" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.databricks_nsg.id
}
