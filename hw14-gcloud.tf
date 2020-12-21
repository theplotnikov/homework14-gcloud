provider "google" {
  project     = "eighth-veld-294505"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "build"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}
resource "google_compute_network" "vpc_network" {
  name                    = "default"
  auto_create_subnetworks = "true"
}


resource "google_compute_instance" "vm_instance" {
  name         = "deploy"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}
resource "google_compute_network" "vpc_network" {
  name                    = "default"
  auto_create_subnetworks = "true"
}
