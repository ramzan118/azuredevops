resource "azuredevops_project" "project" {
  name               = "${var.env}-aks-cicd"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = "GitHub-Service"
  auth_personal {
    personal_access_token = var.github_pat
  }
}

resource "azuredevops_build_definition" "pipeline" {
  project_id = azuredevops_project.project.id
  name       = "${var.env}-blue-green-deployment"

  repository {
    repo_type   = "GitHub"
    repo_name   = var.github_repo
    branch_name = "azureprod"
    yml_path    = "azure-pipelines.yml"
  }

  variable {
    name  = "ACR_NAME"
    value = var.acr_name
  }

  variable {
    name  = "AKS_NAME"
    value = "${var.env}-${var.cluster_name}"
  }

  variable {
    name  = "RESOURCE_GROUP"
    value = var.resource_group
  }

  variable {
    name  = "APP_NAME"
    value = var.app_name
  }

  variable {
    name  = "MONGO_URI"
    value = var.mongo_uri
    is_secret = true
  }
}
