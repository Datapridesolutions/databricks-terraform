terraform {
  required_version = ">= 1.0.0"
  required_providers {
    databricks = {
      source = "databricks/databricks"
      version = ">= 1.0.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

## HARDCODED!!!!!!!!!! ##
## HARDCODED!!!!!!!!!! ##
## HARDCODED!!!!!!!!!! ##
## HARDCODED!!!!!!!!!! ##
provider "databricks" {
  host       = "https://accounts.azuredatabricks.net"
  account_id = "9cbfcaab-48b8-4346-a1d8-8fe3f2888ba9"

  auth_type     = "oauth-m2m"
  client_id     = "daf0113f-58ba-4ffa-889e-7698a15e9783"
  client_secret = "dose73fda64a4279ee5ffc384a4c36ab07c4"
}

provider "azurerm" {
  features {}
  subscription_id = var.data_subscription_id
}

locals {
  access_connectors = {
    "dbac-uks-aibdr-002" = {
      id = "/subscriptions/${var.data_subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Databricks/accessConnectors/dbac-uks-aibdr-002"
      name = "dbac-uks-aibdr-002"
    }
    "dbac-uks-d-extstore-001" = {
      id = "/subscriptions/${var.data_subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Databricks/accessConnectors/dbac-uks-d-extstore-001"
      name = "dbac-uks-d-extstore-001"
      comment = "Ingesting from stuksdl001"
    }
    "dbac-uks-databricks-001" = {
      id = "/subscriptions/${var.data_subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Databricks/accessConnectors/dbac-uks-databricks-001"
      name = "dbac-uks-databricks-001"
    }
    "dbac-uks-metastore-id" = {
      id = "/subscriptions/${var.data_subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Databricks/accessConnectors/dbac-uks-metastore-id"
      name = "uc-metastore-connection"
      comment = "Root storage credential, used to connect to UC metastore "
    }
    "dbac-uks-reporting-001" = {
      id = "/subscriptions/${var.data_subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Databricks/accessConnectors/dbac-uks-reporting-001"
      name = "dbac-uks-reporting-001"
      comment = "Persisting data to stuksreporting001"
    }
  }
}

module "metastore" {
  source = "../../../modules/stacks/metastore"
  metastore_name = var.metastore_name
  metastore_owner = var.metastore_owner
  access_connectors = local.access_connectors
}