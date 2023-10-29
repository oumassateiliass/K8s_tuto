

resource "google_compute_firewall" "allow-ssh" {
  name    = "kube-fw-allow-ssh"
  network = google_compute_network.kube_network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

resource "google_compute_firewall" "allow-kubeadm" {
  name    = "kube-fw-allow-kubeadm"
  network = google_compute_network.kube_network.id
  allow {
    protocol = "tcp"
    ports    = ["6443", "10250", "30000-32767"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "kube-fw-allow-http"
  network = google_compute_network.kube_network.id
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}