output "nic_ids" {
  description = "IDs das interfaces de rede criadas"
  value       = { for k, v in azurerm_network_interface.example : k => v.id }
}

output "vm_id" {
  description = "ID da VM Windows"
  value       = azurerm_windows_virtual_machine.example.id
}
