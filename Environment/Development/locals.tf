locals {
  tags = {
    Environment = "Development"
  }

  private_dns_zone_azuredatabricks = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/privateDnsZones/privatelink.azuredatabricks.net"
  private_dns_zone_blob            = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  private_dns_zone_dfs             = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/privateDnsZones/privatelink.dfs.core.windows.net"
}