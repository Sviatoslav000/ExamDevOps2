output "vm_ip" {

  description = "VM external IP"

  value = google_compute_instance.node.network_interface[0].access_config[0].nat_ip

}

output "vpc_id" {

  description = "VPC ID"

  value = google_compute_network.vpc.id

}

output "ansible_private_key" {

  description = "Path to private SSH key"

  value = local_file.private_key.filename

}

output "ansible_inventory" {

  description = "Generated Ansible inventory"

  value = "../ansible/inventory.ini"

}
