variable "env" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Southeast Asia"
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = "Test_resource_group"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "azure-test-cluster"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "nodejs-app"
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 2
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

variable "acr_id" {
  description = "Azure Container Registry resource ID"
  type        = string
}

variable "acr_server" {
  description = "ACR login server URL"
  type        = string
}

variable "acr_username" {
  description = "ACR admin username"
  type        = string
}

variable "acr_password" {
  description = "ACR admin password"
  type        = string
  sensitive   = true
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
