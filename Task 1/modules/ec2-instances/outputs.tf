output "instance_ids" {
  value = { for k, instance in aws_instance.windows_server : k => instance.id }
}

output "instance_public_ips" {
  value = { for k, instance in aws_instance.windows_server : k => instance.public_ip }
}

output "instance_private_ips" {
  value = { for k, instance in aws_instance.windows_server : k => instance.private_ip }
}