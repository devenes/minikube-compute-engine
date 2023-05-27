project_id        = "project_id"
region            = "us-central1"
zone              = "us-central1-a"
machine_type      = "e2-medium"
disk_size         = 10
image             = "ubuntu-os-cloud/ubuntu-2004-lts"
instance_name     = "minikube-instance"
host_user         = "host_user"
startup_script    = "startup_script.tpl"
label_developer   = "host_user"
label_environment = "dev"
label_source      = "terraform"