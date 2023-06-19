resource "google_container_cluster" "gke-cluster" {
  name = "sonarqube"
  location = "europe-west2"
  node_locations = [
    "europe-west2-b"
  ]
  remove_default_node_pool = true
  initial_node_count = 1
}
resource "google_container_node_pool" "gke-node-pool" {
  name = "sonarqube"
  location = "europe-west2"
  cluster = google_container_cluster.gke-cluster.name
  node_count = 1

  node_config {
    machine_type = "n1-standard-1"
    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      app = "sonarqube"
    }
  }
}
resource "google_compute_disk" "my_disk" {
  name  = "my-gce-pd-volume"
  size  = 10
  type  = "pd-standard"
  zone  = var.zone
}