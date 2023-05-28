output "ssh_command_bastion_host" {
  value = "To SSH into the bastion host, use the following gcloud command:\n\n  gcloud compute ssh ${google_compute_instance.minikube.name} --zone ${var.zone} --project ${var.project_id} --tunnel-through-iap\n\nMake sure you have the gcloud command-line tool installed and configured on your local machine before running the command. Once you have SSHed into the bastion host, you can then use it to access other resources in your Google Cloud environment."
}


output "instance_details_bastion" {
  value = {
    name        = google_compute_instance.minikube.name
    internal_ip = google_compute_instance.minikube.network_interface[0].network_ip
    instance_id = google_compute_instance.minikube.id
    console     = "https://console.cloud.google.com/compute/instancesDetail/zones/${var.zone}/instances/${google_compute_instance.minikube.name}"
  }
}
