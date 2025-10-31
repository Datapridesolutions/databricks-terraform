terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.30.0"
    }
  }
}


resource "azurerm_private_endpoint" "pep_control_plane" {
  name                = "pep-databricks-control-plane"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
 // depends_on = var.depends_on_workspace



  private_service_connection {
    name                           = "psc-databricks-control-plane"
    private_connection_resource_id = var.workspace_ids[0]
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.dns_zone_ids.databricks]
  }
}

resource "azurerm_private_endpoint" "pep_webauth" {
  name                = "pep-databricks-webauth"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  //depends_on = var.depends_on_workspace


  private_service_connection {
    name                           = "psc-databricks-webauth"
    private_connection_resource_id = var.workspace_ids[0]
    is_manual_connection           = false
    subresource_names              = ["browser_authentication"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.dns_zone_ids.databricks]
  }
}

resource "azurerm_private_endpoint" "pep_blob" {
  name                = "pep-databricks-blob"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  //depends_on = var.depends_on_workspace



  private_service_connection {
    name                           = "psc-databricks-blob"
   // private_connection_resource_id = "${var.managed_rg_ids[0]}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_names[0]}"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.managed_rg_ids[0]}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_names[0]}"
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.dns_zone_ids.blob]
  }
}

resource "azurerm_private_endpoint" "pep_dfs" {
  name                = "pep-databricks-dfs"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  //depends_on = var.depends_on_workspace



  private_service_connection {
    name                           = "psc-databricks-dfs"
    //private_connection_resource_id = "${var.managed_rg_ids[0]}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_names[0]}"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.managed_rg_ids[0]}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_names[0]}"
    is_manual_connection           = false
    subresource_names              = ["dfs"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.dns_zone_ids.dfs]
  }
}


resource "azurerm_databricks_access_connector" "this" {
  name                = "dbac-uks-d-extstore-dev"
  resource_group_name = var.resource_group_name
  location            = var.location
  identity {
    type = "SystemAssigned"
  }
}
