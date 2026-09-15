output "nic_ids" {
  value = { for k, v in azurerm_network_interface.example : k => v.id }
}
