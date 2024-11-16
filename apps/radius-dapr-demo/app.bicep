extension radius

@description('The Radius Application ID. Injected automatically by the rad CLI.')
param application string

@description('The Radius Environment name. Injected automatically by the rad CLI.')
param environment string

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

resource gateway 'Applications.Core/gateways@2023-10-01-preview' = {
  name: 'gateway'
  properties: {
    application: application
    routes: [
      {
        path: '/'
        destination: 'http://album-catalog-ui:3000'
      }
    ]
  }
}

resource albumApi 'Applications.Core/containers@2023-10-01-preview' = {
  name: 'album-catalog-api'
  properties: {
    application: application
    environment: environment
    container: {
      image: 'willvelida/album-catalog-api:1.0.0'
      ports: {
        web: {
          containerPort: 8080
        }
      }
    }
    connections: {
      albums:{
        source: stateStore.id
      }
    }
    extensions: [
      {
        kind: 'daprSidecar'
        appId: 'album-catalog-api'
        appPort: 8080
      }
    ]
  }
}

resource albumUi 'Applications.Core/containers@2023-10-01-preview' =   {
  name: 'album-catalog-ui'
  properties: {
    application: application
    environment: environment
    container: {
      image: 'willvelida/album-catalog-ui:latest'
      env: {
        CONNECTION_BACKEND_APPID: {
          value: albumApi.name
        }
        ASPNETCORE_URLS: {
          value: 'http://*:3000'
        }
        ASPNETCORE_ENVIRONMENT: {
          value: 'Development'
        }
      }
      ports: {
        ui: {
          containerPort: 3000
        }
      }
    }
    extensions: [
      { 
        kind: 'daprSidecar'
        appId: 'album-catalog-ui'
      }
    ]
  }
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

resource stateStore 'Applications.Dapr/stateStores@2023-10-01-preview' = {
  name: 'albums'
  properties: {
    environment: environment
    application: application
    resourceProvisioning: 'manual'
    resources: [
      { id: account.id }
      { id: account::tableServices::table.id }
    ]
    metadata: {
      accountName: {
        value: account.name
      }
      accountKey: {
        value: account.listKeys().keys[0].value
      }
      tableName: {
        value: account::tableServices::table.name
      }
    }
    type: 'state.azure.tablestorage'
    version: 'v1'
  }
}
