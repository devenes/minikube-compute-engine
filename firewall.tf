# Using IAP for TCP forwarding https://cloud.google.com/iap/docs/using-tcp-forwarding
resource "google_compute_firewall" "minikube-firewall" {
  name        = var.firewall_name
  network     = google_compute_network.minikube.name
  description = "Allow SSH from IAP tunnel and the Internet"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "35.235.240.0/20"
  ]

  depends_on = [
    google_compute_network.minikube
  ]
}
