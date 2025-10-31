variable "location" {}
variable "resource_group_name" {}
variable "workspace_ids" {
  type = list(string)
}
variable "managed_rg_ids" {
  type = list(string)
}
variable "storage_account_names" {
  type = list(string)
}
variable "subnet_id" {}
variable "dns_zone_ids" {
  type = map(string)
}
variable "depends_on_workspace" {
  type = list(any)
  default = []
}
variable "subscription_id" {
  type = string
}


