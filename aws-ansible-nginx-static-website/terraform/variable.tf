variable "region" {
  default = "ap-southeast-1"
}
variable "availability_zone" {
  default = "ap-southeast-1a"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "dev"
}
variable "name_tag" {
  description = "Name tag"
  default = "aws-ansible-nginx-static-web"
}
variable "domain_name" {
  default = "baolong.homes"
}
