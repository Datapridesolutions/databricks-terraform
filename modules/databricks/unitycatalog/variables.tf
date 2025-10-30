variable "metastore_name" {}
variable "region" {}
variable "metastore_owner" {
  default = "admin@databricks.com"
}
variable "access_connector_id" {}
variable "workspace_ids" {
  type = list(string)
}
variable "external_locations" {
  type = map(string)
}
