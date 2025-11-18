# Databricks Infrastructure as Code

## Setup Instructions

1. Run environments/global/bootstrap as AZ user
2. Then:
   a. Visit https://accounts.azuredatabricks.net
   b. Sign in with Azure AD user (requires Subscription Owner or Contributor role)
   c. First sign-in automatically creates Account record linked to AAD tenant
   d. User becomes Account Admin automatically
   e. User should be made a metastore admin
3. Run global/metastore, after completing the credentials for the new account

