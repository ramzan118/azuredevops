variable "env" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for AKS nodes"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "acr_server" {
  description = "ACR login server"
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

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 2
}
