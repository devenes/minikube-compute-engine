#!/bin/bash

# Update package repositories
apt-get update

# Create a new user
useradd -m ${host_user}

# Install required packages
apt-get install -y ca-certificates curl gnupg apt-transport-https gnupg2 curl jq

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Add user to the docker group
usermod -aG docker ${host_user} && newgrp docker

# Install kubectl
curl -Lo /usr/local/bin/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl

# Install virtualization packages
apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube

# Switch to the new user and start Minikube
su -c "minikube start --driver=docker" - "${host_user}"
