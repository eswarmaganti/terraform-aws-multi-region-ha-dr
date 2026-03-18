variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "vpc_igw_id" {
  type        = string
  description = "VPC Internet Gateway ID"
}

variable "vpc_azs" {
  type        = list(string)
  description = "VPC availability Zone names of the region"
}

variable "public_subnet_cidr" {
  description = "The CIDR for VPC Public Subnet"
  type        = list(string)
}
variable "private_subnet_cidr" {
  description = "The CIDR for VPC Public Subnet"
  type        = list(string)
}
variable "db_subnet_cidr" {
  description = "The CIDR for VPC Public Subnet"
  type        = list(string)
}
