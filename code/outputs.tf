output "public_instance_ip" {
  description = "Публічна IP публічного інстансу"
  value       = aws_instance.public.public_ip
}

output "private_instance_ip" {
  description = "Приватна IP приватного інстансу"
  value       = aws_instance.private.private_ip
}

output "ssh_key_path" {
  description = "Шлях до SSH ключа"
  value       = local_file.private_key.filename
}
