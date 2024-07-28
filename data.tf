data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = "gke-eps-dev-test"
  location = "europe-west3"
}
