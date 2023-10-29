
resource "google_compute_network" "kube_network" {
  name                    = "kube-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "kube_subnet_eu2" {
  name          = "kube-subnet-eu"
  ip_cidr_range = "10.0.0.0/22"
  region        = "us-west2"
  network       = google_compute_network.kube_network.id
  secondary_ip_range {
    range_name    = "secondary"
    ip_cidr_range = "172.16.0.0/24"
  }
}


# resource "google_compute_subnetwork" "kube_subnet_us1" {
#   name          = "kube-subnet-us"
#   ip_cidr_range = "10.0.8.0/22"
#   region        = "us-west1"
#   network       = google_compute_network.kube_network.id
#   secondary_ip_range {
#     range_name    = "secondary"
#     ip_cidr_range = "172.18.0.0/24"
#   }
#   secondary_ip_range {
#     range_name    = "primary"
#     ip_cidr_range = "172.29.0.0/24"
#   }
# }

resource "google_compute_subnetwork" "kube_subnet_us2" {
  name          = "kube-subnet-us"
  ip_cidr_range = "10.0.4.0/22"
  region        = "us-west2"
  network       = google_compute_network.kube_network.id
  secondary_ip_range {
    range_name    = "secondary"
    ip_cidr_range = "172.17.0.0/24"
  }
  secondary_ip_range {
    range_name    = "primary"
    ip_cidr_range = "172.18.0.0/24"
  }
}
