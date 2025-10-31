variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "rg-databricks-prod-uks-01"
}

variable "workspace_name" {
  default = "db-databricks-prod-uks-01"
}

variable "private_subnet_name_prod" {
  default = "snet-databricks-private-10.40.11.0_24"
}

variable "public_subnet_name_prod" {
  default = "snet-databricks-public-10.40.10.0_24"
}
