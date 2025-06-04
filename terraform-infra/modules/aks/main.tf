resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.env}-${var.cluster_name}"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "${var.env}-aks"
  node_resource_group = "${var.env}-aks-nodes"

  default_node_pool {
    name           = "default"
    node_count     = var.node_count
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = var.private_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.10.0.0/16"
    dns_service_ip = "10.10.0.10"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}

resource "kubernetes_secret" "acr_auth" {
  metadata {
    name = "acr-auth"
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.acr_server}" = {
          auth = base64encode("${var.acr_username}:${var.acr_password}")
        }
      }
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}
