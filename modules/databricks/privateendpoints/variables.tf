variable "workspace_ids" { type = list(string) }
variable "managed_rg_ids" { type = list(string) }
variable "storage_account_names" { type = list(string) }
variable "subnet_id" {}
variable "location" {}
variable "resource_group_name" {}
variable "dns_zone_ids" {
  type = object({
    databricks = string
    blob       = string
    dfs        = string
  })
}
