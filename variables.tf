variable "cidr_block" {}
variable "product" {}
variable "environment" {}
variable "publicsubnet_cidr" {}
variable "public_az" {}
variable "privatesubnet_cidr" {}
variable "private_az" {}
variable "costcode" {
    type = number
}
variable "terraform_repo" {
    type = string
}