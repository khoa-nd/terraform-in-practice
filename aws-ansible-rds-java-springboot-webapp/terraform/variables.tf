variable "aws_region" {
  default     = "ap-southeast-1"
  description = "AWS Region"
}

variable "db_pwd" {
  description = "db_pwd"
  sensitive   = true
}

variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-02ee763250491e04a"
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = "notAKey"
}