# VPC

resource "google_compute_network" "vpc" {

  name                    = var.vpc_name
  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "subnet" {

  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id

}

# FIREWALL

resource "google_compute_firewall" "firewall" {

  name    = var.firewall_name
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = ["22", "80", "443", "8000", "8001", "8002", "8003"]
  }

  source_ranges = ["0.0.0.0/0"]

}

# VM

resource "google_compute_instance" "node" {

  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {

    initialize_params {

      image = var.image
      size  = var.disk_size
      type  = "pd-balanced"

    }

  }

  network_interface {

    subnetwork = google_compute_subnetwork.subnet.id

    access_config {}

  }

  metadata = {

    ssh-keys = "ubuntu:${var.ssh_public_key}"

  }
}

# Bucket
resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
}
