variable "workspace_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "vnet_id" {}
variable "private_subnet_name" {}
variable "public_subnet_name" {}
variable "public_nsg_association_id" {}
variable "private_nsg_association_id" {}
variable "public_subnet_network_security_group_association_id" {}
variable "private_subnet_network_security_group_association_id" {}
variable "no_public_ip" {}
variable "public_network_access_enabled" {}
variable "network_security_group_rules_required" {}
variable "customer_managed_key_enabled" {}
variable "tags" {
  type = map(string)
}
