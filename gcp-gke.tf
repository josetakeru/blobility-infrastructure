provider "google" {
    project     = "tier-blobility"
    region      = "europe-west3"
    zone        = "europe-west3-a"
}

resource "google_container_cluster" "kubernetes-cluster" {
  name               = "tier-blobility-gke-cluster"
  location           = "europe-west3-a"
  initial_node_count = 1
}