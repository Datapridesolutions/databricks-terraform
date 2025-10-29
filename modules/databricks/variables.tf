variable "workspace_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "sku" { default = "premium" }
variable "vnet_id" {}
variable "private_subnet_name" {}
variable "public_subnet_name" {}
variable "private_nsg_association_id" {}
variable "public_nsg_association_id" {}
variable "tags" { type = map(string) }
