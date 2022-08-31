resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#resources
resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block_range}"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "${var.name_tag}"
    Environment = "${var.environment_tag}"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet1_cidr_block_range}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.availability_zone}"
  tags = {
    Environment = "${var.environment_tag}"
    Name = "${var.name_tag}"
    Type = "Public"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Environment = "${var.environment_tag}"
    Name = "${var.name_tag}"
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.subnet_public.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}

resource "aws_key_pair" "ec2key" {
  key_name = "notAKey"
  public_key = "${tls_private_key.pk.public_key_openssh}"

  provisioner "local-exec" { # Create keypair to your computer!!
    command = <<EOT
              echo '${tls_private_key.pk.private_key_pem}' > ./notAKey.pem
              chmod 400 notAKey.pem
              EOT
  }
}