#
# VPC Related Variables 
#
variable "vpc_us_name" {
  type        = string
  description = "Name of VPC US"
}

variable "vpc_cidr_us" {
  type        = string
  description = "CIDR block for VPC US"

  validation {
    condition     = endswith(var.vpc_cidr_us, "/16")
    error_message = "Invalid subnet range provided, it should be /16"
  }

}

variable "vpc_us_azs" {
  type        = list(string)
  description = "VPC Availability Zones for US"
  validation {
    condition     = alltrue([for item in var.vpc_us_azs : item != ""]) && length(var.vpc_ap_azs) == 2
    error_message = "Invalid VPC AZs provided, should be equal to 2 values"
  }
}


variable "vpc_ap_name" {
  type        = string
  description = "Name of VPC AP"
}

variable "vpc_cidr_ap" {
  type        = string
  description = "CIDR block for VPC AP"

  validation {
    condition     = endswith(var.vpc_cidr_ap, "/16")
    error_message = "Invalid subnet range provided, it should be /16"
  }
}

variable "vpc_ap_azs" {
  type        = list(string)
  description = "VPC Availability Zones for US"
  validation {
    condition     = alltrue([for item in var.vpc_ap_azs : item != ""]) && length(var.vpc_ap_azs) == 2
    error_message = "Invalid VPC AZs provided, should be equal to 2 values"
  }
}

#
# VPC_US related subnet information
#
variable "us_public_subnet_cidr" {
  type        = list(string)
  description = "The public subnet CIDR for VPC US"

  validation {
    condition     = alltrue([for item in var.us_public_subnet_cidr : endswith(item, "/24")])
    error_message = "Invalid Subnet range provided, It should be /24"
  }
}

variable "us_private_subnet_cidr" {
  type        = list(string)
  description = "The Private subnet CIDR for VPC US"

  validation {
    condition     = alltrue([for item in var.us_private_subnet_cidr : endswith(item, "/24")])
    error_message = "Invalid Subnet range provided, it should be /24"
  }
}

variable "us_db_subnet_cidr" {
  type        = list(string)
  description = "The Database subnet CIDR for VPC US"

  validation {
    condition     = alltrue([for item in var.us_db_subnet_cidr : endswith(item, "/24")])
    error_message = "Invalid Subnet range provided, It should be /24"
  }
}

#
# VPC_AP related subnet information
#
variable "ap_public_subnet_cidr" {
  type        = list(string)
  description = "The public subnet CIDR for VPC AP"

  validation {
    condition     = alltrue([for item in var.ap_public_subnet_cidr : endswith(item, "/24")])
    error_message = "Invalid Subnet range provided, It should be /24"
  }
}

variable "ap_private_subnet_cidr" {
  type        = list(string)
  description = "The Private subnet CIDR for VPC AP"

  validation {
    condition     = alltrue([for item in var.ap_private_subnet_cidr : endswith(item, "/24")])
    error_message = "Invalid Subnet range provided, it should be /24"
  }
}

variable "ap_db_subnet_cidr" {
  type        = list(string)
  description = "The Database subnet CIDR for VPC AP"

  validation {
    condition     = alltrue([for item in var.ap_db_subnet_cidr : endswith(item, "/24")])
    error_message = "Invalid Subnet range provided, It should be /24"
  }
}
