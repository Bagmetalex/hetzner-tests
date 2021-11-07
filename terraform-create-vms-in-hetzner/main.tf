terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      #version = "1.32.0"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a server
resource "hcloud_server" "vm_instance" {
  count = length(var.hostname)
  name        = "${var.hostname[count.index]}"
  image       = "centos-7"
  server_type = "${var.type_vm[count.index]}"
  location    = "fsn1"
}

resource "local_file" "inventory" {
  content = templatefile("inventory.tmpl", { content = tomap({
    for instance in hcloud_server.vm_instance:
      instance.name => instance.ipv4_address
    })
  })
  filename = format("%s/%s", abspath(path.root), "../ansible/inventory.yaml")
}

# Output values_of_vms
output "values_of_vms" {
  value = hcloud_server.vm_instance[*]
}

