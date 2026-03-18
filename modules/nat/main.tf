# Creating Elastic IP to associate with NAT GW
resource "aws_eip" "nat_gw_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.vpc_name}-NAT_GW-EIP"
  }
}

#
# Creating the NAT GW in one of Public Subnet
#
resource "aws_nat_gateway" "nat_gw" {
  subnet_id     = var.public_subnet_ids[0]
  allocation_id = aws_eip.nat_gw_eip.id

  tags = {
    Name = "${var.vpc_name}-NAT_GW"
  }
}


# Creating Route table and associations for private subnet
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
}

# associating subnets to private route table
resource "aws_route_table_association" "private_rt_association" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_rt.id
}

