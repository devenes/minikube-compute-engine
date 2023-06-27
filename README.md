<div align="center" id="top"> 
  <img src="./.github/minikube-banner.jpg" alt="Minikube Compute Engine1" />

&#xa0;

  <!-- <a href="https://minikubecomputeengine1.netlify.app">Demo</a> -->
</div>

<h1 align="center">Install Minikube on Google Compute Engine</h1>
<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/devenes/minikube-compute-engine?color=56BEB8">
  <img alt="Github language count" src="https://img.shields.io/github/languages/count/devenes/minikube-compute-engine?color=56BEB8">
  <img alt="Repository size" src="https://img.shields.io/github/repo-size/devenes/minikube-compute-engine?color=56BEB8">
  <img alt="License" src="https://img.shields.io/github/license/devenes/minikube-compute-engine?color=56BEB8">
  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/devenes/minikube-compute-engine?color=56BEB8" /> -->
  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/devenes/minikube-compute-engine?color=56BEB8" /> -->
  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/devenes/minikube-compute-engine?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center">
	🚧  Minikube Compute Engine1 🚀 Under construction...  🚧
</h4>

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/devenes" target="_blank">Author</a>
</p>

<br>

## :dart: About

Install Minikube on Google Compute Engine

## :rocket: Technologies

The following tools were used in this project:

- [Terrafom](https://www.terraform.io/)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstarts)
- [Google Cloud Platform](https://cloud.google.com/)
- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes](https://kubernetes.io/)
- [Docker](https://www.docker.com/)

## :white_check_mark: Requirements

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com), [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstarts) and [Terraform](https://www.terraform.io/) installed.

## :checkered_flag: Starting

```bash
# Clone this project
git clone https://github.com/devenes/minikube-compute-engine

# Access
cd minikube-compute-engine

# Inıtialize terraform
terraform init

# Create a plan
terraform plan

# Apply the plan
terraform apply
```

## Access Minikube Dashboard

![Minikube Dashboard](.github/minikube-dashboard.png)

To access the Minikube Dashboard, you can follow these steps:

1. Configure Kubernetes Dashboard with Terraform:

- Use Terraform to automate the configuration of the Kubernetes Dashboard.
- Apply the Terraform plan to provision the necessary resources.

2. Retrieve the Minikube Dashboard URL:

- After successfully applying the Terraform plan, the URL to access the Minikube Dashboard will be displayed in the Terraform output.
- The URL typically follows this format: `http://<IP_ADDRESS>:<PORT>/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/`
- An example output would look like this:

  ```js
  Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

  Outputs:

  minikube_dashboard_url = "http://104.197.59.212:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/"
  ```

3. Access the Minikube Dashboard:

- Copy the URL provided in the Terraform output.
- Open your preferred web browser and paste the URL into the address bar.
- Press Enter to navigate to the Minikube Dashboard.

4. Restrict access to the dashboard (optional):

- If you want to restrict access to the dashboard, you can modify the `firewall.tf` file.
- Inside the file, locate the resource block for the `google_compute_firewall` named `minikube-firewall`.
- Add your IP address to the `source_ranges` list as `"YOUR_IP_ADDRESS/32"`.
  - Replace `"YOUR_IP_ADDRESS"` with your actual IP address.
  - The `/32` subnet mask ensures that only your specific IP address has access.
- Save the firewall.tf file.

  ```tf
  resource "google_compute_firewall" "minikube-firewall" {
    name    = "minikube-firewall"
    network = "default"

    allow {
      protocol = "tcp"
      ports    = ["8001"]
    }

    source_ranges = ["YOUR_IP_ADDRESS/32"]
  }
  ```

By following these steps, you will be able to access the Minikube Dashboard using the provided URL. Additionally, if you choose to restrict access, only the IP address specified in the source_ranges list will be able to access the dashboard.

## :memo: License

This project is under license from MIT. For more details, see the [LICENSE](LICENSE) file.

Made with :heart: by <a href="https://github.com/devenes" target="_blank">devenes</a>

&#xa0;

<a href="#top">⬆️ Back to top</a>
