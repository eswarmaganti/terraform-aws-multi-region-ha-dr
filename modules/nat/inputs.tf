
variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The VPC Public Subnet ID"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The VPC Public Subnet IDs"
}
