/*
SUMMARY: Module create network peer from one virtual network to another
DESCRIPTION: The following components will be required parameters in this deployment
    parResourceGroupLocation
    parResourceGroupName
AUTHOR/S: aultt
VERSION: 1.0.0
*/

@description('Virtual Network ID of Virtual Network destination. No default')
param parDestinationVirtualNetworkID string

@description('Name of source Virtual Network we are peering. No default')
param parSourceVirtualNetworkName string

@description('Name of destination virtual network we are peering.  No Default')
param parDestinationVirtualNetworkName string

@description('Switch to enable/disable Virtual Network Access for the Network Peer. Default = true')
param parAllowVirtualNetworkAccess bool = true

@description('Switch to enable/disable forwarded Traffic for the Network Peer. Default = true')
param parAllowForwardedTraffic bool = true

@description('Switch to enable/disable forwarded Traffic for the Network Peer. Default = false')
param parAllowGatewayTransit bool = false

resource resVirtualNetworkPeer 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-11-01' = {
  name:  '${parSourceVirtualNetworkName}/peer-to-${parDestinationVirtualNetworkName}'
  properties: {
    allowVirtualNetworkAccess: parAllowVirtualNetworkAccess
    allowForwardedTraffic: parAllowForwardedTraffic
    allowGatewayTransit: parAllowGatewayTransit
    remoteVirtualNetwork: {
        id: parDestinationVirtualNetworkID
    }
  }
}