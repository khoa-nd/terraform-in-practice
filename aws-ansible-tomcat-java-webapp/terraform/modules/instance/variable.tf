variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "subnet_public_id" {
  description = "VPC public subnet id"
  default = ""
}
variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = list
  default = []
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}
variable "name_tag" {
  description = "Name tag"
  default = ""
}
variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}
variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-02ee763250491e04a"
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.medium"
}