# public subnet outputs
output "public_subnet_ids" {
  value = [for item in aws_subnet.public : item.id]
}
output "public_subnet_arns" {
  value = [for item in aws_subnet.public : item.arn]
}

# private subnet outputs
output "private_subnet_ids" {
  value = [for item in aws_subnet.private : item.id]
}
output "private_subnet_arns" {
  value = [for item in aws_subnet.private : item.arn]
}

# db subnets outputs
output "db_subnet_ids" {
  value = [for item in aws_subnet.db : item.id]
}
output "db_subnet_arns" {
  value = [for item in aws_subnet.db : item.arn]
}
