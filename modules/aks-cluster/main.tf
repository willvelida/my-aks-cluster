resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  location = var.location
  resource_group_name = var.rg_name
  dns_prefix = var.aks_name
  role_based_access_control_enabled = true
  tags = var.tags

  default_node_pool {
    name = "default"
    node_count = var.node_count
    vm_size = var.vm_size
  }

  identity {
    type = "UserAssigned"
    identity_ids = [ var.identity_ids ]
  }

  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }

  monitor_metrics {
    annotations_allowed = null
    labels_allowed = null
  }

  linux_profile {
    admin_username = var.username
    ssh_key {
      key_data = var.ssh_public_key
    }
  }
}