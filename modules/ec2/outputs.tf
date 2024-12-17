output "public_ip" {
  value       = aws_instance.web.public_ip
}


output "server_id" {
  value       = aws_instance.web.id
}


output "server_state" {
  value       = aws_instance.web.instance_state
}


output "server_arn" {
  value       = aws_instance.web.arn
}


output "server_dns" {
  value       = aws_instance.web.public_dns
}