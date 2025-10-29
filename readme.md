# Terraform Azure Databricks Deployment

This repository provisions Azure Databricks workspaces using Terraform across dev, test, and prod environments. It supports modular infrastructure, Unity Catalog integration, private endpoints, and medallion architecture (raw, silver, gold).

---

## 📁 Directory Structure





## Modules
databricks_workspace 
    Provisions Databricks workspace with VNet injection
    Supports CMK, NSG rules, and environment tagging

private_endpoints
    Control plane, blob, dfs, and webauth endpoints

DNS zone group integration
    access_connector
    Enables Unity Catalog access to ADLS Gen2

unity_catalog
    Metastore creation
    Workspace assignments
    Storage credential and external location mapping

network
    NSG rules for AAD and Azure Front Door
    Subnet delegation and private endpoint subnet

## Security & Governance
    NSG rules: AllowAAD-dp, AllowAzureFrontDoor-dp
    Public network access disabled
    CMK and infrastructure encryption enabled
    Unity Catalog with credential mapping
    RBAC via Azure roles and databricks_grants


## Unity Catalog Notes
    Requires Databricks Account Console setup
    Storage must be ADLS Gen2 with is_hns_enabled = true
    External locations use abfss://<container>@<account>.dfs.core.windows.net/
    Access connector must have Blob Data Contributor role

## Best Practices
    Use azurerm_key_vault_secret for secrets
    Avoid hardcoding tokens in .tfvars
    Add conditional logic for optional resources
    Use environment-based prefixes/suffixes
    Protect prod with manual approval gates
    Enable audit logging and change tracking
	Approval paths for Github Actions :Validate ,plan and apply


## Monitoring & Logging
    Placeholder for integration with Azure Monitor, Log Analytics, and Databricks audit logs.

## Compliance & Change Management
    Placeholder for policy-as-code, drift detection, and approval workflows.