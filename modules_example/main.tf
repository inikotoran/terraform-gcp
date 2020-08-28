terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.36.0"
    }
  }
}

provider "google" {
  credentials = file(var.credential)

  project = var.project
  region  = "asia-southeast2"
  zone    = "asia-southeast2-a"
}

module "vm" {
  source     = "../"
  project    = "high-fuze-767"
  app_name   = "use-modules"
  credential = "../../credential.json"
  tpl_file   = "apache.tpl"
}

output "ip" {
    value = module.vm.webserver_ip
}
