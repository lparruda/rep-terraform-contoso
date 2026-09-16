output "vm_public_ips" {
  description = "IPs Publicos das maquinas virtuais"
  value = {
    "vm-linux-01" = azurerm_public_ip.pip_vm_linux_1.ip_address
    "vm-linux-02" = azurerm_public_ip.pip_vm_linux_2.ip_address
    "vm-linux-03" = azurerm_public_ip.pip_vm_linux_3.ip_address
  }
}
