output "vm_public_ips" {
  description = "IP Publico da VM Windows"
  value = {
    "vm-win-01" = azurerm_public_ip.pip_vm_win_1.ip_address
  }
}
