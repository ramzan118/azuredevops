variable "env" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "github_pat" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "GitHub repository in format 'owner/repo'"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "mongo_uri" {
  description = "MongoDB connection string"
  type        = string
  sensitive   = true
}

variable "azure_devops_org" {
  description = "Azure DevOps organization name"
  type        = string
}

variable "azure_devops_pat" {
  description = "Azure DevOps Personal Access Token"
  type        = string
  sensitive   = true
}
