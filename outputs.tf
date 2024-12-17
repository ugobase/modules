output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "public_ip" {
  value       = module.ec2.public_ip
}

output "server_id" {
  value       = module.ec2.server_id
}

output "az" {
  value = module.vpc.az
}

output "sg" {
  value = module.vpc.sg
}


output "subnet-id" {
  value = module.vpc.subnet-id
}

output "vpc_owner_id" {
  value = module.vpc.vpc_owner_id
}

output "server_state" {
  value       = module.ec2.server_state
}

output "server_arn" {
  value       = module.ec2.server_arn
}

output "server_dns" {
  value       = module.ec2.server_dns
}









/*
output "rt_1_id" {
  value = module.vpc.rt_1_id
}



output "rt_2_id" {
  value = module.vpc.rt_1_id
}
*/
