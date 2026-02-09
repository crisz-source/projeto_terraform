output "vm_public_ip" {
  description = "IP publico da VM"
  value       = azurerm_public_ip.main.ip_address
}

output "ssh_command" {
  description = "Comando para conectar via SSH"
  value       = "ssh -i terraform/ssh_key ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}

output "app_url" {
  description = "URL da aplicacao"
  value       = "http://${azurerm_public_ip.main.ip_address}"
}