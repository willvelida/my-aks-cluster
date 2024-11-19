@description('The name of the Cosmos DB account')
param accountName string = 'sql-${uniqueString(resourceGroup().id)}'

@description('The location where the Cosmos DB account will be created')
param location string = resourceGroup().location

@description('The tags that will be applied to the Cosmos DB account')
param tags object = {
  Demo: 'MSIgnite-2024'
  Author: 'willvelida'
  Environment: 'Dev'
}

@minValue(400)
@maxValue(1000)
@description('The throughput provisioned at the container level')
param throughput int = 400

@description('The name of the Database')
param databaseName string = 'AlbumDB'

@description('The name of the Container')
param containerName string = 'albums'

resource account 'Microsoft.DocumentDB/databaseAccounts@2024-09-01-preview' = {
  name: accountName
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
  }
}

resource database 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2024-09-01-preview' = {
  name: databaseName
  parent: account
  properties: {
    resource: {
      id: databaseName
    }
  }
}

resource container 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2024-09-01-preview' = {
  name: containerName
  parent: database
  properties: {
    resource: {
      id: containerName
      partitionKey: {
        paths: [
          '/id'
        ]
        kind: 'Hash'
      }
      indexingPolicy: {
        indexingMode: 'consistent'
        includedPaths: [
          { 
            path: '/*'
          }
        ]
      }
    }
    options: {
      throughput: throughput
    }
  }
}

@description('The Id of the account')
output accountId string = account.id

@description('The Id of the Database')
output databaseId string = database.id

@description('The Id of the Container')
output containerId string = container.id

@description('The url for the created account')
output accountUrl string = account.properties.documentEndpoint

@description('The master key for the account')
output masterKey string = account.listKeys().primaryMasterKey

@description('The name of the database')
output database string = database.name

@description('The name of the container')
output container string = container.name
