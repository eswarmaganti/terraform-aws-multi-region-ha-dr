# 
# Defining the subnets for VPC
#

# Dynamically creating Public subnet in multiple AZ's
resource "aws_subnet" "public" {
  count = length(var.vpc_azs)

  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = var.vpc_azs[count.index]

  tags = {
    Name   = "${var.vpc_name}-${var.vpc_azs[count.index]}-PublicSubnet"
    Tier   = "Public"
    Region = "${split("_", var.vpc_name)[1]}"
  }
}

# Dynamically creating Private subnet in multiple AZ's
resource "aws_subnet" "private" {
  count = length(var.vpc_azs)

  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.vpc_azs[count.index]

  tags = {
    Name = "${var.vpc_name}-${var.vpc_azs[count.index]}-PrivateSubnet"
    Tier   = "Private"
    Region = "${split("_", var.vpc_name)[1]}"
  }
}

# Dynamically creating DB subnet in multiple AZ's
resource "aws_subnet" "db" {
  count = length(var.vpc_azs)

  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_cidr[count.index]
  availability_zone = var.vpc_azs[count.index]

  tags = {
    Name = "${var.vpc_name}-${var.vpc_azs[count.index]}-DBSubnet"
    Tier   = "Database"
    Region = "${split("_", var.vpc_name)[1]}"
  }
}


# Creating the Route table and association for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.vpc_igw_id
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}



