variable "workspace_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "vnet_id" {}
variable "private_subnet_name" {}
variable "public_subnet_name" {}
variable "private_nsg_association_id" {}
variable "public_nsg_association_id" {}
variable "tags" {
  type = map(string)
}
variable "public_subnet_network_security_group_association_id" {
  type = string
}
variable "private_subnet_network_security_group_association_id" {
  type = string
}

variable "public_network_access_enabled" {
  type = bool
  default = true
}

variable "network_security_group_rules_required" {
  type = string
  default = "NoAzureDatabricksRules"
}

variable "customer_managed_key_enabled" {
  type = bool
  default = true
}

variable "no_public_ip" {
  type = bool
  default = true
}

