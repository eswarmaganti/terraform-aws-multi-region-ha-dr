output "nat_gw_id" {
  value = aws_nat_gateway.nat_gw.id
}

output "nat_gw_eip_id" {
  value = aws_eip.nat_gw_eip.id
}
