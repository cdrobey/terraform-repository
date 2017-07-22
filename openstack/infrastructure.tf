variable "puppet_master_name" {
  description = "The fqdn of the puppet master"
  default = "puppet.infrastructure.lab"
}

variable "puppet_master_ip" {
  description = "The IP address of the puppet master"
  default = "192.168.1.10"
}

module "base_network" {
  source = "./networking"
}

module "puppet_master" {
  source = "./puppet_master"

  control_repo         = "${var.puppet_control_repo}"
  ssh_pri_key          = "${var.ssh_private_key}"
  ssh_pub_key          = "${var.ssh_public_key}"
}
