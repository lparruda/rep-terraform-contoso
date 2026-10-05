module "network_dev" {
  source = "../../../modulos/virtual_network"

  vnet_name           = "vnet_dev"
  address_space       = ["10.1.0.0/16"]
  local               = "brazilsouth"
  resource_group_name = "rg-contoso-dev"

  subnet = {
    "subnet_dev1" = {
      address_prefixes = ["10.1.1.0/24"]
    }
    "subnet_dev2" = {
      address_prefixes = ["10.1.2.0/24"]
    }
  }
}

# 1. Cria o NSG do Swarm em DEV
resource "azurerm_network_security_group" "nsg_swarm" {
  name                = "nsg-swarm"
  location            = "brazilsouth"
  resource_group_name = "rg-contoso-dev"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "187.21.13.216"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "187.21.13.216"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow9090"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "9090"
    source_address_prefix      = "187.21.13.216"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "187.21.13.216"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowDNS"
    priority                   = 135
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "53"
    source_address_prefix      = "187.21.13.216"
    destination_address_prefix = "*"
  }
}

# 2. Associa à subnet_dev1
resource "azurerm_subnet_network_security_group_association" "nsg_subnet1" {
  subnet_id                 = "/subscriptions/ac1c748c-cf7e-4d1e-82a0-d52c7062c9b2/resourceGroups/rg-contoso-dev/providers/Microsoft.Network/virtualNetworks/vnet_dev/subnets/subnet_dev1"
  network_security_group_id = azurerm_network_security_group.nsg_swarm.id
}
