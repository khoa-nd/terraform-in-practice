variable "domain_name" {
  description = "Domain name"
  default = ""
}
variable "aRecords" {
  type = list
  default = []
}
variable "cnameRecords" {
  type = list
  default = []
}
variable "ttl" {
  description = "time to live"
  default = 300
}
variable "environment_tag" {
  description = "Environment tag"
  default = ""
}