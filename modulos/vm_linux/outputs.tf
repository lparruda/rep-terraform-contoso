output "nic_ids" {
  value = { for k, v in azurerm_network_interface.example : k => v.id }
}

output "vm_id" {
  description = "ID da Virtual Machine Linux"
  value       = azurerm_linux_virtual_machine.example.id
}

