data "azuread_application_published_app_ids" "well_known" {}

data "azuread_service_principal" "msgraph" {
  client_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
}

resource "azuread_application" "global_databricks" {
####  display_name = "app-databricks-globaltest-001"
  display_name = "app-databricks-globaltemp-001"
  
  tags = [
  ]
  
  required_resource_access {
    resource_app_id = data.azuread_service_principal.msgraph.client_id
    
    resource_access {
      id = data.azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"]
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "global_databricks" {
  client_id = azuread_application.global_databricks.client_id
  
  tags = [
    "HideApp",
    "WindowsAzureActiveDirectoryIntegratedApp"
  ]
}

resource "azurerm_role_assignment" "subscription_contributor" {
  scope = "/subscriptions/${var.data_subscription_id}"
  role_definition_name = "Contributor"
  principal_id = azuread_service_principal.global_databricks.object_id
}
