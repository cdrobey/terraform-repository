#--------------------------------------------------------------
# This module creates all demonstration resources
#--------------------------------------------------------------

#--------------------------------------------------------------
# Module: Build Openstack Demonstration Site
#--------------------------------------------------------------
module "site" {
  source = "../modules/site"

  router         = "${var.router}"
  network0       = "${var.network0}"
  subnet0        = "${var.subnet0}"
  network0_cidr  = "${var.network0_cidr}"
}

#--------------------------------------------------------------
# Module: Build Puppet Master Server
#--------------------------------------------------------------
module "puppet_master" {
  source = "../modules/puppet_master"

  name              = "${var.puppet_master_name}"
  domain            = "${var.puppet_master_domain}"
  tenant_network    = "${module.site.site_network}"
  git_pri_key       = "${var.git_pri_key}"
  git_pub_key       = "${var.git_pub_key}"
  git_url           = "${var.git_url}"
  openstack_keypair = "${var.openstack_keypair}"
}

#--------------------------------------------------------------
# Module: Build LINUX Server
#--------------------------------------------------------------
module "linux01" {
  source = "../modules/linux"

  linux_name        = "linux01"
  linux_domain      = "${var.linux_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}

#--------------------------------------------------------------
# Module: Build LINUX Server
#--------------------------------------------------------------
module "linux02" {
  source = "../modules/linux"

  linux_name        = "linux02"
  linux_domain      = "${var.linux_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}

#--------------------------------------------------------------
# Module: Build LINUX Server
#--------------------------------------------------------------
module "linux03" {
  source = "../modules/linux"

  linux_name        = "linux03"
  linux_domain      = "${var.linux_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}

#--------------------------------------------------------------
# Module: Build LINUX Server
#--------------------------------------------------------------
module "linux04" {
  source = "../modules/linux"

  linux_name        = "linux04"
  linux_domain      = "${var.linux_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}

#--------------------------------------------------------------
# Module: Build LINUX Server
#--------------------------------------------------------------
module "linux05" {
  source = "../modules/linux"

  linux_name        = "linux05"
  linux_domain      = "${var.linux_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}

#--------------------------------------------------------------
# Module: Build Windows Server
#--------------------------------------------------------------
module "windows01" {
  source = "../modules/windows"

  windows_name      = "${var.windows_name}"
  windows_domain    = "${var.windows_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}
#--------------------------------------------------------------
# Module: Build Windows Server
#--------------------------------------------------------------
module "devwin01" {
  source = "../modules/windows"

  windows_name      = "devwin01"
  windows_domain    = "${var.windows_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}
#--------------------------------------------------------------
# Module: Build Windows Server
#--------------------------------------------------------------
module "prdwin01" {
  source = "../modules/windows"

  windows_name      = "prdwin01"
  windows_domain    = "${var.windows_domain}"
  master_name       = "${var.puppet_master_name}"
  master_domain     = "${var.puppet_master_domain}"
  master_ip         = "${module.puppet_master.puppet_master_ip}"
  tenant_network    = "${module.site.site_network}"
  openstack_keypair = "${var.openstack_keypair}"
}
