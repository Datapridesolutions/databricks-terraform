variable "location" {
  default = "uksouth"
}
variable "private_subnet_name_dev" {
  default = "snet-databricks-private-10.30.11.0_24"
}

variable "public_subnet_name_dev" {
  default = "snet-databricks-public-10.30.10.0_24"
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

variable "vnet_name_dev" {
  default = "vnet-databricks-dev-uks-01" 
  }

