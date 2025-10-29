output "private_nsg_id" {
  value = azurerm_subnet_network_security_group_association.private_subnet_association.id
}

output "public_nsg_id" {
  value = azurerm_subnet_network_security_group_association.public_subnet_association.id
}

output "pep_subnet_id" {
  value = azurerm_subnet.databricks_pep_snet.id
}
