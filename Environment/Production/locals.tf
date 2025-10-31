locals {
  tags = {
    Environment = "Production"
    Owner       = "DatabricksTeam"
    Project     = "EnterpriseAnalytics"
  }

  private_dns_zone_azuredatabricks = "/subscriptions/70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485/resourceGroups/rg-network-prod/providers/Microsoft.Network/privateDnsZones/privatelink.azuredatabricks.net"
  private_dns_zone_blob            = "/subscriptions/70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485/resourceGroups/rg-network-prod/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  private_dns_zone_dfs             = "/subscriptions/70dcb1f3-7b2f-4f8f-afa2-5ef1bf53d485/resourceGroups/rg-network-prod/providers/Microsoft.Network/privateDnsZones/privatelink.dfs.core.windows.net"
}
