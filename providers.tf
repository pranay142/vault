terraform {
  required_version = "1.9.3"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
  project = "iron-cycle-423315-u8"
  region  = "europe-west3"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token = data.google_client_config.provider.access_token

    cluster_ca_certificate = base64decode(
      data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate
    )
  }
}
