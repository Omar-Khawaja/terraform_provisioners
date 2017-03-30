
variable "access_key" {}
variable "secret_key" {}
variable "region" {}

variable "ami" {
  type = "map"
  default = {
  <AWS region> = "<ami appropriate for region>"
  <AWS region> = "<ami appropriate for region>"
  <AWS region> = "<ami appropriate for region>"
  }
}

variable "name" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "security_group" {
  default = "<enter default security group ID"
}
variable "volume_type" {
  default = "gp2"
}
variable "volume_size" {
  default = 8
}
variable "delete_on_termination" {
  default = "true"
}

variable "username" {
  default = "centos"
}

variable "keyname" {}

variable "public_key" {
  default = "<path to your public key>"
}
variable "private_key" {
  default = "<path to your private key"
}
