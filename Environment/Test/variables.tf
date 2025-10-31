variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "rg-databricks-test-uks-01"
}

variable "workspace_name" {
  default = "db-databricks-test-uks-01"
}

variable "private_subnet_name_test" {
  default = "snet-databricks-private-10.20.11.0_24"
}

variable "public_subnet_name_test" {
  default = "snet-databricks-public-10.20.10.0_24"
}
