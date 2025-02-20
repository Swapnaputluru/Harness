provider "google" {
  project = "driven-utility-451505-c1"
  zone    = "europe-west1-b"  # Specify the single zone
}

resource "google_container_cluster" "gke_cluster" {
  name     = "my-gke-cluster1"
  location = "europe-west1-b"  # Ensure the cluster is single-zone

  initial_node_count = 1  # Only one VM as a node
  node_locations     = ["europe-west1-b"]  # Restrict nodes to a single zone

  node_config {
    service_account = "devops-e2e-sa@driven-utility-451505-c1.iam.gserviceaccount.com"
    machine_type    = "e2-medium"
    disk_size_gb    = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  lifecycle {
    prevent_destroy = false
  }
}
