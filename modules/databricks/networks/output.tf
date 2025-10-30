output "private_nsg_id" {
  value = azurerm_network_security_group.private_nsg.id
}

output "public_nsg_id" {
  value = azurerm_network_security_group.public_nsg.id
}

output "pep_subnet_id" {
  value = azurerm_subnet.pep_subnet.id
}

output "private_subnet_nsg_assoc_id" {
  value = azurerm_subnet_network_security_group_association.private_nsg_assoc.id
}

output "public_subnet_nsg_assoc_id" {
  value = azurerm_subnet_network_security_group_association.public_nsg_assoc.id
}


