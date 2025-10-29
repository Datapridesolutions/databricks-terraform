resource "azurerm_subnet" "public_subnet" {
  name                 = "snet-databricks-public-10.30.10.0_24"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "vnet-databricks-dev-uks-01"
  address_prefixes     = ["10.30.10.0/24"]

  delegation {
    name = "Microsoft.Databricks.workspaces"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

resource "azurerm_subnet" "private_subnet" {
  name                 = "snet-databricks-private-10.30.0.0_24"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "vnet-databricks-dev-uks-01"
  address_prefixes     = ["10.30.0.0/24"]

  delegation {
    name = "Microsoft.Databricks.workspaces"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}


resource "azurerm_subnet" "databricks_pep_snet" {
  name                 = "snet-databricks-privatelink-pep-10.30.4.0_27"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "vnet-databricks-dev-uks-01"
  address_prefixes     = ["10.30.4.0/27"]
}
