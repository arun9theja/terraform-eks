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

variable "desired_capacity" {}

variable "cidr_block" {}

variable "az_count" {}

variable "region" {}

variable "owners" {}

variable "max_size" {}


variable "min_size" {}

