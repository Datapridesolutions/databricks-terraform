##/subscriptions/70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485/resourceGroups/rg-databricks-prod-uks-01/providers/Microsoft.Network/virtualNetworks/vnet-databricks-prod-uks-03/subnets/snet-databricks-prod-uks-03-pep

locals {
  psc_controlplane_name = "${module.dbricks_names.private_endpoint_controlplane}-psc"
  psc_webauth_name      = "${module.dbricks_names.private_endpoint_webauth}-psc"
  psc_blob_name         = "${module.dbricks_names.private_endpoint_blob}-psc"
  psc_dfs_name          = "${module.dbricks_names.private_endpoint_dfs}-psc"
}

resource "azurerm_private_endpoint" "pep_control_plane" {
  name                = module.dbricks_names.private_endpoint_controlplane
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
  subnet_id           = azurerm_subnet.pep.id

  private_service_connection {
    name                           = local.psc_controlplane_name
    private_connection_resource_id = azurerm_databricks_workspace.this.id
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.databricks.id]
  }
  timeouts {
    create = "10m"
    delete = "10m"
  }
}

resource "azurerm_private_endpoint" "pep_webauth" {
  name                = module.dbricks_names.private_endpoint_webauth
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
  subnet_id           = azurerm_subnet.pep.id

  private_service_connection {
    name                           = local.psc_webauth_name
    private_connection_resource_id = azurerm_databricks_workspace.this.id
    is_manual_connection           = false
    subresource_names              = ["browser_authentication"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.databricks.id]
  }
  depends_on = [
    azurerm_private_endpoint.pep_control_plane
  ]

  timeouts {
    create = "10m"
    delete = "10m"
  }
}

resource "azurerm_private_endpoint" "pep_blob" {
  name                = module.dbricks_names.private_endpoint_blob
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
  subnet_id           = azurerm_subnet.pep.id
 
  private_service_connection {
    name                           = local.psc_blob_name
    private_connection_resource_id = azurerm_storage_account.adls.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.blob.id]
  }
  depends_on = [
    azurerm_private_endpoint.pep_webauth
  ]

  timeouts {
    create = "10m"
    delete = "10m"
  }
}

resource "azurerm_private_endpoint" "pep_dfs" {
  name                = module.dbricks_names.private_endpoint_dfs
  location            = module.region_uksouth.region.location
  resource_group_name = azurerm_resource_group.network.name
  subnet_id           = azurerm_subnet.pep.id

  private_service_connection {
    name                           = local.psc_dfs_name
    private_connection_resource_id = azurerm_storage_account.adls.id
    is_manual_connection           = false
    subresource_names              = ["dfs"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.dfs.id]
  }
  depends_on = [
    azurerm_private_endpoint.pep_blob
  ]

  timeouts {
    create = "10m"
    delete = "10m"
  }
}
