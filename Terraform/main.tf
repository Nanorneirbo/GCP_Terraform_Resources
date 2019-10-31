provider "google" {
  credentials = "D:/IntelliJprojects/Terraform/ronan-test-project-243307-e3d1a262dc00.json"
  project     = "ronan-test-project-243307"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_image" "nano-image" {
  name = "nano-image"
  family = "ubuntu-1804-lts"
}

resource "google_compute_network" "nano-network" {
  name = "nano-network"
}

resource "google_compute_disk" "nano-disk" {
  name = "nano-disk"
  size = 30
  }

resource "google_compute_instance" "nano_instance" {
  machine_type = "n1-standard-1"
  name = "nano_instance"

  boot_disk {
    device_name = google_compute_image.nano-image.name
  }
  network_interface {
    network = google_compute_network.nano-network.name
  }
}