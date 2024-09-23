resource "azurerm_kubernetes_cluster_extension" "ext" {
  name = var.ext_name
  cluster_id = var.cluster_id
  extension_type = var.extension_type
  release_train = "Stable"
  configuration_settings = var.configuration_settings
}