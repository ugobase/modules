output "vpc_arn" {
  value = aws_vpc.first-vpc.arn
}

output "vpc_tenancy" {
  value = aws_vpc.first-vpc.instance_tenancy
}

output "az" {
  value = data.aws_availability_zones.az.names
}

output "vpc_id" {
  value = aws_vpc.first-vpc.id
}

output "subnet-id" {
  value = [for subnet in aws_subnet.first-vpc-subnet : subnet.id]
}

output "sg" {
  value = aws_security_group.allow_traffic.id
}

output "vpc_owner_id" {
  value = aws_vpc.first-vpc.owner_id
}
