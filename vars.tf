variable "project_id" {
  type        = string
  description = "(required) The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the GKE cluster in"
  default     = "europe-west3"
}

variable "gke_cluster_name" {
  type        = string
  description = "The name of the GKE cluster"
  default     = "gke-eps-dev-test"
}

variable "kubernetes_namespace" {
  type        = string
  description = "The Kubernetes namespace to deploy Vault into"
  default     = "vault"
}

variable "kubernetes_sa_name" {
  type        = string
  description = "The Kubernetes Service Account that Vault will use"
  default     = "vault-sa"
}

variable "helm_release_name" {
  type        = string
  description = "The name of the Helm release"
  default     = "vault"
}

variable "helm_chart_name" {
  type        = string
  description = "The chart name in the Helm repository"
  default     = "vault"
}

variable "helm_repository" {
  type        = string
  description = "The location of the Helm repository"
  default     = "https://helm.releases.hashicorp.com/"
}

variable "helm_chart_version" {
  type        = string
  description = "The location of the Helm repository"
  default     = "v0.28.0"
}

variable "vault_image_repository" {
  type        = string
  description = "The repository to pull the Vault image from"
  default     = "hashicorp/vault"
}

variable "vault_image_tag" {
  type        = string
  description = "The image tag to use when pulling the Vault image"
  default     = "1.9.4"
}

variable "vault_leader_tls_servername" {
  type        = string
  description = "The TLS server name to use when connecting with HTTPS"
  default     = null
}

variable "vault_data_storage_size" {
  type        = string
  description = "The size, in Gi, of the data storage volume"
  default     = "10"
}

variable "vault_ui" {
  type        = bool
  description = "Enable the Vault UI"
  default     = true
}

variable "vault_seal_method" {
  type        = string
  description = "The Vault seal method to use"
  default     = "shamir"
}

variable "vault_replica_count" {
  type        = number
  description = "The number of nodes to create in the cluster's default node pool"
  default     = 1
}

variable "kubernetes_vault_server_service_type" {
  type        = string
  description = "The kubernetes service type for the Vault service"
  default     = "ClusterIP"
}

variable "kubernetes_vault_ui_service_type" {
  type        = string
  description = "The kubernetes service type for the Vault UI"
  default     = "ClusterIP"
}
