#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}

variable "instance_type" {
  default = "t3.micro"
  type    = "string"
}

variable "desired_capacity" {
  default = 1
}

variable "cidr_block" {}

variable "az_count" {}

variable "region" {}
