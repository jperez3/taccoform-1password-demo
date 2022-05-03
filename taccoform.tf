terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~>2.19.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}

resource "digitalocean_droplet" "taccoform" {
  image     = "ubuntu-20-04-x64"
  name      = "taccoform-demo"
  region    = "sfo2"
  size      = "s-1vcpu-1gb"
}
