module "vm_teste" {
  source = "../../../modulos/vm_linux"

  resource_group_name             = "rg-contoso-prd"
  local                           = "brazilsouth"
  vm_name                         = "vmlinux1"
  size                            = "Standard_F2"
  disable_password_authentication = false
  admin_username                  = "avaroot"
  admin_password                  = "Alexandre@2051"


  os_disk_caching              = "ReadWrite"
  os_disk_storage_account_type = "Standard_LRS"

  network_interfaces = {
    "vm_linux_data_nic" = {
      ip_configuration_name         = "internal"
      private_ip_address_allocation = "Dynamic"
      private_ip_address            = null
      primary                       = true
      subnet_id                     = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-prd/providers/Microsoft.Network/virtualNetworks/vnet_prd/subnets/subnet_prd1"
    }
  }

  tags = {
    env        = "prd"
    management = "terraform"
    vscode = "teste"
  }

}