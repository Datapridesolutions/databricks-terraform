resource "azurerm_virtual_network" "this" {
  name                = module.dbricks_names.network.virtual_network
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = [var.network_settings.virtual_network_address_range]
}

resource "azurerm_subnet" "private" {
  name                 = module.dbricks_names.network.private_subnet
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.network_settings.private_subnet_address_range]
  delegation {
    name = "databricks-delegation"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "public" {
  name                 = module.dbricks_names.network.public_subnet
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.network_settings.public_subnet_address_range]
  delegation {
    name = "databricks-delegation"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "pep" {
  name                 = module.dbricks_names.network.pep_subnet
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.network_settings.pep_subnet_address_range]
}

resource "azurerm_network_security_group" "private_nsg" {
  name                = module.dbricks_names.network.private_nsg
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_network_security_group" "public_nsg" {
  name                = module.dbricks_names.network.public_nsg
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_network_security_group" "pep_nsg" {
  name                = module.dbricks_names.network.pep_nsg
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_subnet_network_security_group_association" "private_nsg_assoc" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "public_nsg_assoc" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "pep_nsg_assoc" {
  subnet_id                 = azurerm_subnet.pep.id
  network_security_group_id = azurerm_network_security_group.pep_nsg.id
}
