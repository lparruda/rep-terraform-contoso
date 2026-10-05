
module "nsg_swarm" {
  source = "../../../modulos/nsg"

  azurerm_resource_group         = "rg-contoso-dev"
  local                          = "brazilsouth"
  azurerm_network_security_group = "nsg-swarm"

  azurerm_network_security_rule = {
    "Allow8080" = {
      name                       = "Allow8080"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "8080"
      destination_port_ranges    = null
      source_address_prefix      = "187.21.13.216"
      destination_address_prefix = "*"
    },
    "AllowSSH" = {
      name                       = "AllowSSH"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      destination_port_ranges    = null
      source_address_prefix      = "187.21.13.216"
      destination_address_prefix = "*"
    },
    "Allow9090" = {
      name                       = "Allow9090"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "9090"
      destination_port_ranges    = null
      source_address_prefix      = "187.21.13.216"
      destination_address_prefix = "*"
    },
    "AllowHTTP" = {
      name                       = "AllowHTTP"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      destination_port_ranges    = null
      source_address_prefix      = "187.21.13.216"
      destination_address_prefix = "*"
    },
    "AllowDNS" = {
      name                       = "AllowDNS"
      priority                   = 135
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "53"
      destination_port_ranges    = null
      source_address_prefix      = "187.21.13.216"
      destination_address_prefix = "*"
    }
  }
}

# Associação do NSG à subnet correta das VMs
  azurerm_subnet_network_security_group_association = {
    "assoc_subnet_dev1" = {
      subnet_id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/virtualNetworks/vnet_dev/subnets/subnet_dev1"
    }
  }
}

# Import declarativo para o Terraform assumir o nsg-swarm sem dar conflito de existência
#import {
#  to = module.nsg_swarm.azurerm_network_security_group.example
#  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-swarm"
#} 

#import {
#  to = module.nsg_swarm.azurerm_network_security_rule.security_rule["Allow8080"]
#  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-swarm/securityRules/Allow8080"
#}

#import {
#  to = module.nsg_swarm.azurerm_network_security_rule.security_rule["AllowSSH"]
#  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-swarm/securityRules/AllowSSH"
#}

#import {
#  to = module.nsg_swarm.azurerm_network_security_rule.security_rule["Allow9090"]
#  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-swarm/securityRules/Allow9090"
#}

#import {
#  to = module.nsg_swarm.azurerm_network_security_rule.security_rule["AllowHTTP"]
#  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-swarm/securityRules/AllowHTTP"
#}

#import {
#  to = module.nsg_swarm.azurerm_network_security_rule.security_rule["AllowDNS"]
#  id = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-swarm/securityRules/AllowDNS"
#}
