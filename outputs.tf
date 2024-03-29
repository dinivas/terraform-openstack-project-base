output "bastion_instance_id" {
  value = "${openstack_compute_instance_v2.bastion.id}"
}

output "bastion_private_key" {
  value       = "${module.bastion_generated_keypair.private_key}"
  description = "The generated private Key to access bastion"
  sensitive   = true
}

output "bastion_private_key_file" {
  value       = "${local_file.bastion_private_key.filename}"
  description = "The private Key file (generated) to access bastion"
}

output "mgmt_network_id" {
  value       = "${module.mgmt_network.network_id}"
  description = "The id of the Mgmt Network being created"
}

output "mgmt_network_name" {
  value       = "${module.mgmt_network.network_name}"
  description = "The name of the Mgmt Network being created"
}

output "mgmt_subnet_ids" {
  value       = "${module.mgmt_network.subnet_ids}"
  description = "The id of all mgmt subnets being created"
}

output "mgmt_subnet_names" {
  value       = "${module.mgmt_network.subnet_names}"
  description = "The names of all mgmt subnets being created"
}

output "project_router_id" {
  value       = "${openstack_networking_router_v2.project_router.0.id}"
  description = "The project router id"
}

output "bastion_floating_ip" {
  value       = "${local.bastion_floating_ip}"
  description = "The floating ip bind to bastion"
}

output "proxy_floating_ip" {
  value       = "${var.proxy_prefered_floating_ip != "" ? data.openstack_networking_floatingip_v2.proxy_floatingip.0.address : openstack_networking_floatingip_v2.proxy_floatingip.0.address}"
  description = "The floating ip bind to proxy"
}

output "project_keypair_name" {
  value       = "${module.project_generated_keypair.name}"
  description = "Default keypair used for project hosts"
}

output "project_private_key" {
  value       = "${module.project_generated_keypair.private_key}"
  description = "The private Key used for project"
  sensitive   = true
}

output "consul_server_instance_ids" {
  value = "${openstack_compute_instance_v2.consul_server.*.id}"
}

output "consul_client_instance_ids" {
  value = "${openstack_compute_instance_v2.consul_client.*.id}"
}

output "ssh_via_bastion_config" {
  value = {
    host_private_key    = "${module.project_generated_keypair.private_key}"
    bastion_host        = "${local.bastion_floating_ip}"
    bastion_private_key = "${module.bastion_generated_keypair.private_key}"
  }
}
