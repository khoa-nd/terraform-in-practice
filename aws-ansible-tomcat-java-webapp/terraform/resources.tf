provider "aws" {
  region  = "${var.region}"
}

module "networkModule" {
    source			= "./modules/network"
	availability_zone = "${var.availability_zone}"
	environment_tag = "${var.environment_tag}"
	name_tag = "${var.name_tag}"
}

module "securityGroupModule" {
    source			= "./modules/securityGroup"
	vpc_id			= "${module.networkModule.vpc_id}"
	environment_tag = "${var.environment_tag}"
	name_tag = "${var.name_tag}"
}

module "instanceModule" {
	source 				= "./modules/instance"
 	vpc_id 				= "${module.networkModule.vpc_id}"
	subnet_public_id	="${module.networkModule.public_subnets[0]}"
	key_pair_name		="${module.networkModule.ec2keyName}"
	security_group_ids 	= ["${module.securityGroupModule.sg_22}", "${module.securityGroupModule.sg_80}", "${module.securityGroupModule.sg_8080}"]
	environment_tag 	= "${var.environment_tag}"
	name_tag = "${var.name_tag}"
}

module "dnsModule" {
	source 		= "./modules/dns"
	domain_name	= "${var.domain_name}"
	aRecords	= [
		"${var.domain_name} ${module.instanceModule.instance_eip}",
	]
	cnameRecords	= [
		"www.${var.domain_name} ${var.domain_name}"
	]
}