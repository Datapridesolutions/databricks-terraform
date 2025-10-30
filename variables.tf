variable "location" {
  default = "uksouth"
}

variable "workspace_name" {
  default = "db-databricks-dev-uks-01"
}

variable "resource_group_name" {
  default = "rg-databricks-dev-uks-01"
}

variable "sku" {
  default = "premium"
}

variable "vnet_id" {
  default = "/subscriptions/70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485/resourceGroups/rg-databricks-dev-uks-01/providers/Microsoft.Network/virtualNetworks/vnet-databricks-dev-uks-01"
}

variable "private_subnet_name_dev" {
  default = "snet-databricks-private-10.30.11.0_24"
}

variable "public_subnet_name_dev" {
  default = "snet-databricks-public-10.30.10.0_24"
}

