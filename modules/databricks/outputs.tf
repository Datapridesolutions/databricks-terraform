output "workspace_id" {
  value = azurerm_databricks_workspace.this.id
}

output "managed_resource_group_id" {
  value = azurerm_databricks_workspace.this.managed_resource_group_id
}
