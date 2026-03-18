#
# VPC related outputs
#
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_arn" {
  value = aws_vpc.vpc.arn
}

#
# IGW related outputs
#
output "vpc_igw_id" {
  value = aws_internet_gateway.igw.id
}

output "vpc_igw_arn" {
  value = aws_internet_gateway.igw.arn
}
