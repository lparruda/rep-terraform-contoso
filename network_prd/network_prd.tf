module "network_prd" {
    source = "../modulos/virtual_network"

    vnet_name = "vnet_prd"
    address_space = ["10.0.0.0/16"]
    local = "brazilsouth"
    resource_group_name = "rg-contoso-prd"

    subnet = {
      "subnet_prd1" = {
        address_prefixes = ["10.0.2.0/24"]
      }
      "subnet_prd2" = {
        address_prefixes = ["10.0.3.0/24"]
      }
      
    }



}
import {
  to = module.network_prd.azurerm_virtual_network.example
  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-prd/providers/Microsoft.Network/virtualNetworks/vnet_prd"
}

import {
  to = module.network_prd.azurerm_subnet.example["subnet_prd1"]
  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-prd/providers/Microsoft.Network/virtualNetworks/vnet_prd/subnets/subnet_prd1"
}

import {
  to = module.network_prd.azurerm_subnet.example["subnet_prd2"]
  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-prd/providers/Microsoft.Network/virtualNetworks/vnet_prd/subnets/subnet_prd2"
}
