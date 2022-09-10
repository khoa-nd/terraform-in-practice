resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2key" {
  key_name = "${var.key_pair_name}"
  public_key = "${tls_private_key.pk.public_key_openssh}"

  provisioner "local-exec" { # Create keypair to your computer!!
    command = <<EOT
              echo '${tls_private_key.pk.private_key_pem}' > ./${var.key_pair_name}.pem
              chmod 400 ${var.key_pair_name}.pem
              EOT
  }
}