variable "resource_type" {
  type = string
  validation {
    condition = contains([
      "resource_group",
      "managed_identity",
      "databricks_workspace",
      "private_endpoint",
      "storage_account",
      "databricks_access_connector"
    ], var.resource_type)
    error_message = "Resource type must be one of: resource_group, managed_identity, databricks_workspace, private_endpoint, storage_account, databricks_access_connector."
  }
}

variable "identifier" {
  type = string
  validation {
    condition = var.resource_type == "storage_account" ? (
      length(var.identifier) >= 1 && length(var.identifier) <= 13
    ) : (
      length(var.identifier) >= 1 && length(var.identifier) <= 20
    )
    error_message = "Identifier length validation failed. For storage_account: 1-13 characters (to ensure 'st' + identifier + env(4) + region(3) + '01' ≤ 24). For other resources: 1-20 characters."
  }
  validation {
    condition     = can(regex("^[a-z][a-z0-9]*$", var.identifier))
    error_message = "Identifier must start with a lowercase letter and contain only lowercase letters and numbers."
  }
}

variable "environment" {
  type = object({
    name = string
    code = string
  })
  validation {
    condition     = length(var.environment.code) >= 3 && length(var.environment.code) <= 4
    error_message = "Environment code must be between 3 and 4 characters."
  }
  validation {
    condition     = can(regex("^[a-z]+$", var.environment.code))
    error_message = "Environment code must contain only lowercase letters."
  }
}

variable "region" {
  type = object({
    code = string
    location = string
  })
}