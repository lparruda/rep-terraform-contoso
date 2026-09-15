resource "azurerm_network_interface" "example" {
  for_each            = var.network_interfaces
  name                = each.key
  location            = var.local
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = each.key
    subnet_id                     = each.value.subnet_id
    primary                       = each.value.primary
    private_ip_address_allocation = each.value.private_ip_address_allocation
    private_ip_address            = try(element(split(",", (lookup(each.value, "private_ip_address"))), 0), null)
    public_ip_address_id          = lookup(each.value, "public_ip_address_id", null)
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.local
  size                            = var.size
  disable_password_authentication = var.disable_password_authentication
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  network_interface_ids           = values(azurerm_network_interface.example)[*].id
  tags                            = var.tags

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
}
