output "ssh_command_minikube" {
  value = "To SSH into the host, use the following gcloud command:\n\n  gcloud compute ssh ${google_compute_instance.minikube.name} --zone ${var.zone} --project ${var.project_id} --tunnel-through-iap\n\nMake sure you have the gcloud command-line tool installed and configured on your local machine before running the command. Once you have SSHed into the host, you can then use it to access other resources in your Google Cloud environment."
}


output "instance_details_minikube" {
  value = {
    instance_name    = google_compute_instance.minikube.name
    instance_id      = google_compute_instance.minikube.id
    instance_zone    = google_compute_instance.minikube.zone
    instance_network = google_compute_instance.minikube.network_interface.0.network
    instance_labels  = google_compute_instance.minikube.labels
    ip_internal      = google_compute_instance.minikube.network_interface[0].network_ip
    ip_external      = google_compute_instance.minikube.network_interface.0.access_config.0.nat_ip
    console          = "https://console.cloud.google.com/compute/instancesDetail/zones/${var.zone}/instances/${google_compute_instance.minikube.name}"
  }
}


# Print Minikube Dashboard URL
output "minikube_dashboard_url" {
  value = "http://${google_compute_instance.minikube.network_interface.0.access_config.0.nat_ip}:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/"
}
