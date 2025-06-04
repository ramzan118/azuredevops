module "network" {
  source         = "../../modules/network"
  env            = var.env
  location       = var.location
  resource_group = var.resource_group
}

module "aks" {
  source            = "../../modules/aks"
  env               = var.env
  location          = var.location
  resource_group    = var.resource_group
  cluster_name      = var.cluster_name
  private_subnet_id = module.network.private_subnet_id
  acr_id            = var.acr_id
  acr_server        = var.acr_server
  acr_username      = var.acr_username
  acr_password      = var.acr_password
  node_count        = var.node_count
}

module "cicd" {
  source           = "../../modules/cicd"
  env              = var.env
  github_pat       = var.github_pat
  github_repo      = var.github_repo
  acr_name         = var.acr_name
  cluster_name     = var.cluster_name
  resource_group   = var.resource_group
  app_name         = var.app_name
  mongo_uri        = var.mongo_uri
  azure_devops_org = var.azure_devops_org
  azure_devops_pat = var.azure_devops_pat
}

resource "local_file" "kubeconfig" {
  filename = "kubeconfig-${var.env}"
  content  = module.aks.kube_config
}
