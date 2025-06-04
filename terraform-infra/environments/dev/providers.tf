terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.5"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  alias           = "azure_sub1"
}

provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/${var.azure_devops_org}"
  personal_access_token = var.azure_devops_pat
}
