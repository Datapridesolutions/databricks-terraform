locals {
  env_applications = {
    for env_key, env in var.environments :
    env_key => "app-databricks-${env.code}-001"
  }
}

resource "azuread_application" "env_databricks" {
  for_each = local.env_applications
  
  display_name = each.value
  
  tags = [
  ]
}

resource "azuread_service_principal" "env_databricks" {
  for_each = azuread_application.env_databricks
  
  client_id = each.value.client_id
  
  tags = [
  ]
}
