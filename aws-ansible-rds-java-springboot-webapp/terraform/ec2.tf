resource "aws_instance" "instance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = aws_subnet.public_subnet[0].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name = aws_key_pair.ec2key.key_name

  tags = {
    Name = "EC2 instance"
	}
}