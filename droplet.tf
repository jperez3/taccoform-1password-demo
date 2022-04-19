resource "digitalocean_droplet" "op" {
  image     = "ubuntu-20-04-x64"
  name      = "op-demo"
  region    = "sfo2"
  size      = "s-1vcpu-1gb"
}
