@description('The name of the Cosmos DB account')
param accountName string = 'store${uniqueString(resourceGroup().id)}'

@description('The location where the Cosmos DB account will be created')
param location string = resourceGroup().location

@description('The tags that will be applied to the Cosmos DB account')
param tags object = {
  Demo: 'MSIgnite-2024'
  Author: 'willvelida'
  Environment: 'Dev'
}

resource account 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: accountName
  location: location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }

  resource tableServices 'tableServices' = {
    name: 'default'

    resource table 'tables' = {
      name: 'albums'
    }
  }
}


output accountName string = account.name
output accountKey string = account.listKeys().keys[0].value
output tableName string = account::tableServices::table.name
