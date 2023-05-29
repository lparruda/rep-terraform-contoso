module "nsg" {
    source = "../modulos/nsg"

    local = "brazilsouth"
    azurerm_resource_group = "rg-bradesco-prd-nsg"
    azurerm_network_security_group = "nsg"
    azurerm_network_security_rule = {
      "AzureFrontDoor.FirstParty-In" = {
        access = "Allow"
        destination_address_prefix = "*"
        destination_port_range = "80"
        destination_port_ranges = null
        direction = "Inbound"
        name = "AzureFrontDoor.FirstParty-In"
        priority = 104
        protocol = "Tcp"
        source_address_prefix = "AzureFrontDoor.FirstParty"
        source_port_range = "*"
      }
      "Block_Internet_Inbound" = {
        access = "Deny"
        destination_address_prefix = "Internet"
        destination_port_range = "*"
        destination_port_ranges = null
        direction = "Inbound"
        name = "Block_Internet_Inbound"
        priority = 4096
        protocol = "*"
        source_address_prefix = "10.245.144.0/21"
        source_port_range = "*"
      }
      
    }

    azurerm_subnet_network_security_group_association = {
      "association1" = {
        subnet_id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-bradesco-prd/providers/Microsoft.Network/virtualNetworks/vnet_prd/subnets/subnet_prd1"
      }
    }
  
}