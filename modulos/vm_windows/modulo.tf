resource "azurerm_network_interface" "example" {
  for_each            = var.network_interfaces
  name                = each.key
  location            = var.local
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    private_ip_address            = each.value.private_ip_address
    primary                       = each.value.primary
    public_ip_address_id          = each.value.public_ip_address_id
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.local
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    for nic in azurerm_network_interface.example : nic.id
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  tags = var.tags
}
