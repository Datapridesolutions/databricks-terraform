import {
  to = module.bootstrap.azuread_application.global_databricks
  id = "/applications/7d923166-d413-4acb-949b-ad98628cc031"
}

import {
  to = module.bootstrap.azuread_service_principal.global_databricks
  #requires service-principal-object-id:
  # az ad sp show --id <Application (client) ID> --query id -o tsv
  id = "/servicePrincipals/453ddc81-daa8-40b3-a5a0-f309bdf2ed77"
}

# import {
#   to = module.bootstrap.azuread_application.env_databricks["dev"]
#   id = "/applications/00000000-0000-0000-0000-000000000000"
# }

# import {
#   to = module.bootstrap.azuread_service_principal.env_databricks["dev"]
#   id = "/servicePrincipals/00000000-0000-0000-0000-000000000000"
# }

# import {
#   to = module.bootstrap.azuread_application.env_databricks["test"]
#   id = "/applications/00000000-0000-0000-0000-000000000000"
# }

# import {
#   to = module.bootstrap.azuread_service_principal.env_databricks["test"]
#   id = "/servicePrincipals/00000000-0000-0000-0000-000000000000"
# }

import {
  to = module.bootstrap.azurerm_role_assignment.subscription_contributor
  #requires roleAssignmentId:
  # az role assignment list --assignee <service-principal-object-id> --output json
  id = "/subscriptions/488b5eec-551f-4a9d-b201-18e5a1324d68/providers/Microsoft.Authorization/roleAssignments/5e47f5b2-3834-4170-aac1-3c088711e5fa"
}

# import {
#   to = module.bootstrap.azurerm_role_assignment.storage_blob_contributor["storage_account_name"]
#   id = "/subscriptions/488b5eec-551f-4a9d-b201-18e5a1324d68/resourceGroups/your-rg/providers/Microsoft.Storage/storageAccounts/your-storage-account/providers/Microsoft.Authorization/roleAssignments/00000000-0000-0000-0000-000000000000"
# }
