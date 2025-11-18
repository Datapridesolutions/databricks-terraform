output "global_app_registration" {
  value = {
    name           = azuread_application.global_databricks.display_name
    id             = azuread_application.global_databricks.id
    application_id = azuread_application.global_databricks.client_id
    object_id      = azuread_application.global_databricks.object_id
  }
}

output "global_service_principal" {
  value = {
    id         = azuread_service_principal.global_databricks.id
    object_id  = azuread_service_principal.global_databricks.object_id
    client_id  = azuread_service_principal.global_databricks.client_id
  }
}

output "env_app_registrations" {
  value = {
    for env_key, app in azuread_application.env_databricks :
    env_key => {
      name           = app.display_name
      id             = app.id
      application_id = app.client_id
      object_id      = app.object_id
    }
  }
}

output "env_service_principals" {
  value = {
    for env_key, sp in azuread_service_principal.env_databricks :
    env_key => {
      id         = sp.id
      object_id  = sp.object_id
      client_id  = sp.client_id
    }
  }
}

output "env_applications" {
  value = {
    for env_key in keys(local.env_applications) :
    env_key => {
      name           = azuread_application.env_databricks[env_key].display_name
      id             = azuread_application.env_databricks[env_key].id
      application_id = azuread_application.env_databricks[env_key].client_id
      object_id      = azuread_application.env_databricks[env_key].object_id
      sp_object_id   = azuread_service_principal.env_databricks[env_key].object_id
    }
  }
}