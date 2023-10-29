# resource "google_container_cluster" "private" {
#   provider = google-beta

#   name     = "sofrecom"
#   location = "us-west2"

#   network    = google_compute_network.kube_network.name
#   subnetwork = google_compute_subnetwork.kube_subnet_us2.id

#   # Enable Autopilot for this cluster
#   enable_autopilot = true

#   # Configuration of cluster IP allocation for VPC-native clusters
#   ip_allocation_policy {
#     cluster_secondary_range_name  = "primary"
#     services_secondary_range_name = "secondary"
#   }

#   # Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters.
#   release_channel {
#     channel = "REGULAR"
#   }
# }