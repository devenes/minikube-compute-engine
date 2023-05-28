resource "google_compute_instance" "minikube" {
  name         = var.instance_name
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type

  metadata_startup_script = templatefile("${path.module}/${var.startup_script}", {
    host_user = var.host_user,
  })

  labels = {
    "source"      = var.label_source
    "developer"   = var.label_developer
    "environment" = var.label_environment
  }

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size

    }
  }

  network_interface {
    network = google_compute_network.minikube.name

    access_config {
      // Ephemeral IP
    }
  }
}
