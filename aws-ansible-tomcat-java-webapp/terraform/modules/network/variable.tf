variable "availability_zone" {}

variable "cidr_block_range" {
  description = "The CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default = "10.1.0.0/24"
}
variable "subnet2_cidr_block_range" {
  description = "The CIDR block for private subnet of VPC"
  default = "10.2.0.0/24"
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}
variable "name_tag" {
  description = "name tag"
  default = ""
}