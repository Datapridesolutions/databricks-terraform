import {
  to = module.metastore.databricks_metastore.metastore
  id = "160718b3-933e-46bf-8f75-d423a1ef0801"
}

# import {
#   to = module.metastore.databricks_metastore_assignment.assignments["db-uks-d-databricks-001"]
#   id = "db-uks-d-databricks-001|160718b3-933e-46bf-8f75-d423a1ef0801"
# }

# import {
#   to = module.metastore.databricks_metastore_assignment.assignments["db-uks-d-databricks-webauth-MustNotDelete"]
#   id = "db-uks-d-databricks-webauth-MustNotDelete|160718b3-933e-46bf-8f75-d423a1ef0801"
# }

import {
  to = module.metastore.databricks_storage_credential.access_connectors["dbac-uks-aibdr-002"]
  id = "160718b3-933e-46bf-8f75-d423a1ef0801|dbac-uks-aibdr-002"
}

import {
  to = module.metastore.databricks_storage_credential.access_connectors["dbac-uks-d-extstore-001"]
  id = "160718b3-933e-46bf-8f75-d423a1ef0801|dbac-uks-d-extstore-001"
}

import {
  to = module.metastore.databricks_storage_credential.access_connectors["dbac-uks-databricks-001"]
  id = "160718b3-933e-46bf-8f75-d423a1ef0801|dbac-uks-databricks-001"
}

import {
  to = module.metastore.databricks_storage_credential.access_connectors["dbac-uks-metastore-id"]
  id = "160718b3-933e-46bf-8f75-d423a1ef0801|uc-metastore-connection"
}

import {
  to = module.metastore.databricks_storage_credential.access_connectors["dbac-uks-reporting-001"]
  id = "160718b3-933e-46bf-8f75-d423a1ef0801|dbac-uks-reporting-001"
}