# 1. IP Público Estático Standard
resource "azurerm_public_ip" "pip_vm_linux_1" {
  name                = "pip-vm-linux-01"
  resource_group_name = "rg-contoso-dev"
  location            = "brazilsouth"
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    env        = "prd"
    management = "terraform"
  }
}

# 2. Network Security Group (SSH liberado)
resource "azurerm_network_security_group" "nsg_vm_linux_1" {
  name                = "nsg-vm-linux-01"
  resource_group_name = "rg-contoso-dev"
  location            = "brazilsouth"

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    env        = "prd"
    management = "terraform"
  }
}

# 3. Módulo VM Linux
module "vm_teste_1" {
  source = "../../../modulos/vm_linux"

  resource_group_name             = "rg-contoso-dev"
  local                           = "brazilsouth"
  vm_name                         = "vm-linux-01"
  size                            = "Standard_D2s_v5"
  disable_password_authentication = false
  admin_username                  = "azroot"
  admin_password                  = "AlexDumas2051"

  source_image_reference = {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  os_disk_caching              = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"

  network_interfaces = {
    "vm_linux_data_nic_1" = {
      ip_configuration_name         = "internal"
      private_ip_address_allocation = "Dynamic"
      private_ip_address            = null
      primary                       = true
      subnet_id                     = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/virtualNetworks/vnet_dev/subnets/subnet_dev1"
      public_ip_address_id          = azurerm_public_ip.pip_vm_linux_1.id
    }
  }

  tags = {
    env        = "prd"
    management = "terraform"
    vscode     = "teste"
  }
}

# 4. Associação NSG com a NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg_1" {
  network_interface_id      = module.vm_teste_1.nic_ids["vm_linux_data_nic_1"]
  network_security_group_id = azurerm_network_security_group.nsg_vm_linux_1.id
}

resource "azurerm_managed_disk" "disk_linux_01" {
  name                 = "disk-data-vm-linux-01"
  location             = "brazilsouth"
  resource_group_name  = "rg-contoso-dev"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10

  tags = {
    env        = "prd"
    management = "terraform"
    vscode     = "teste"
  }
}

  resource "azurerm_virtual_machine_data_disk_attachment" "attach_linux_02" {
  managed_disk_id    = azurerm_managed_disk.disk_linux_01.id
  virtual_machine_id = module.vm_teste_1.vm_id
  lun                = 10
  caching            = "ReadWrite"
}
