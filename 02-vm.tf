resource "google_compute_instance" "app" {
  name         = "${var.app_name}-app"
  machine_type = "f1-micro"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = data.template_file.startup.rendered
}

data "template_file" "startup" {
  template = file(var.tpl_file)
}
