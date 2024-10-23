resource "azapi_resource" "aks" {
  type                      = "Microsoft.ContainerService/managedClusters@2024-03-02-preview"
  parent_id                 = var.resource_group_id
  location                  = var.location
  name                      = var.aks_cluster_name
  schema_validation_enabled = false

  body = {
    tags = var.tags
    identity = {
      type = "SystemAssigned"
    },
    properties = {
      agentPoolProfiles = [
        {
          name   = "systempool"
          count  = 3
          vmSize = "Standard_D2s_v3"
          osType = "Linux"
          mode   = "System"
        }
      ]
      addonProfiles = {
        omsagent = {
          enabled = true
          config = {
            logAnalyticsWorkspaceResourceID = var.log_analytics_workspace_id
            useAADAuth                      = "true"
          }
        }
      }
      azureMonitorProfile = {
        metrics = {
          enabled = true,
          kubeStateMetrics = {
            metricLabelsAllowlist      = "",
            metricAnnotationsAllowList = ""
          }
        },
        containerInsights = {
          enabled                         = true
          logAnalyticsWorkspaceResourceID = var.log_analytics_workspace_id
        }
      }
    }
    sku = {
      name = "Automatic"
      tier = "Standard"
    }
  }

  response_export_values = [
    "properties.identityProfile.kubeletidentity.objectId",
    "properties.oidcIssuerProfile.issuerURL",
    "properties.nodeResourceGroup"
  ]
}

resource "azurerm_role_assignment" "aksrole" {
  principal_id         = var.current_object_id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  scope                = azapi_resource.aks.id
}