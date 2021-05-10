variable "mod_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "mod_vpc_tenancy" {
  default = "dedicated"
}

variable "mod_vpc_id" {}

variable "mod_subnet_cidr" {
  default = "10.0.0.0/24"
}