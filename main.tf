resource "google_container_cluster" "pythonetl-cluster" {
  name     = "pythonetl-cluster"
  location = var.zone

  remove_default_node_pool = true
}

resource "google_container_node_pool" "default" {
  name       = "default"
  cluster    = google_container_cluster.pythonetl-cluster.name
  location   = google_container_cluster.pythonetl-cluster.location
  node_count = 1
}