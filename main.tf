resource "google_container_cluster" "my_cluster" {
  name               = "my-cluster"
  location           = "europe-west2"
  initial_node_count = 1
  release_channel    = "regular"
  network            = "projects/eng-district-390211/global/networks/default"
  subnetwork         = "projects/eng-district-390211/regions/europe-west2/subnetworks/default"
  cluster_ipv4_cidr  = "/17"
  services_ipv4_cidr = "/22"
}
resource "google_compute_disk" "my_disk" {
  name  = "my-gce-pd-volume"
  size  = 10
  type  = "pd-standard"
  zone  = var.zone
}