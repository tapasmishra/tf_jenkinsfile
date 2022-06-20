resource "openstack_networking_floatingip_v2" "myip" {
  pool = "${var.public_network_name}"
}

//data "template_file" "user_data" {
  //template = file("${path.module}/templates/conf_data.yaml")
//}

resource "openstack_compute_keypair_v2" "demo_keypair" {
  name       = "${var.openstack_key}"
  public_key = var.public_key
}

resource "openstack_networking_port_v2" "ports" {
  count          = 1 
  name           = "${format("port-%02d", count.index + 1)}"
  network_id     = "${var.private_network_id}"
  admin_state_up = "true"
  port_security_enabled = "false"
}

resource "openstack_compute_instance_v2" "agw_deployment"{
  name            = "${var.prefix}"
  image_name       = "${var.image_name}"
  flavor_id       = "${var.flavor_id}"
  key_pair        = openstack_compute_keypair_v2.demo_keypair.name
  //user_data       = data.template_file.user_data.rendered
network {
    port = "${openstack_networking_port_v2.ports.*.id[0]}"
  }
}


resource "openstack_networking_floatingip_associate_v2" "myip" {
  floating_ip = "${openstack_networking_floatingip_v2.myip.address}"
  port_id = "${openstack_networking_port_v2.ports.*.id[0]}"
}

