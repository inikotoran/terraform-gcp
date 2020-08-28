resource "google_compute_instance" "app" {
  name         = "${var.app_name}-app"
  machine_type = "f1-micro"
  tags         = ["http-server"]

  depends_on = [google_compute_firewall.demo_network]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_firewall.demo_network.network

    access_config {}
  }

  metadata_startup_script = data.template_file.startup.rendered
}

data "template_file" "startup" {
  template = file(var.tpl_file)
}

resource "google_compute_network" "demo_network" {
  name                    = "${var.app_name}-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "demo_network" {
  name    = "allow-ssh-and-icmp"
  network = google_compute_network.demo_network.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
}
