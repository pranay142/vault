resource "kubernetes_namespace" "vault" {
  metadata {
    name = var.kubernetes_namespace
  }
}

resource "kubernetes_service_account" "vault" {
  metadata {
    name        = var.kubernetes_sa_name
    namespace   = var.kubernetes_namespace
  }
}

#------------------------------------------------------------------------------
# Vault deployment
#------------------------------------------------------------------------------
resource "helm_release" "vault" {
  name       = var.helm_release_name
  repository = var.helm_repository
  chart      = var.helm_chart_name
  namespace  = var.kubernetes_namespace
  version    = var.helm_chart_version

  values = [
    templatefile("templates/values.tmpl", {
      helm_release_name = var.helm_release_name

      kubernetes_namespace                          = var.kubernetes_namespace
      kubernetes_vault_server_service_type          = var.kubernetes_vault_server_service_type
      kubernetes_vault_ui_service_type              = var.kubernetes_vault_ui_service_type
      kubernetes_vault_service_account              = kubernetes_service_account.vault.metadata.0.name

      vault_replica_count             = var.vault_replica_count
      vault_image_repository          = var.vault_image_repository
      vault_image_tag                 = var.vault_image_tag
      vault_data_storage_size         = var.vault_data_storage_size
      vault_leader_tls_servername     = var.vault_leader_tls_servername
      vault_seal_method               = var.vault_seal_method
    })
  ]
}
