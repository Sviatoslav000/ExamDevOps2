output "vm_ip" {

  description = "VM external IP"

  value = google_compute_instance.node.network_interface[0].access_config[0].nat_ip

}

output "vpc_id" {

  description = "VPC ID"

  value = google_compute_network.vpc.id

}
