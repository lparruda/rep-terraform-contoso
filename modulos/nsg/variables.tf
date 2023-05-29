variable "azurerm_resource_group" {
    type = string
  
}
variable "local" {
    type = string
  
}
variable "azurerm_network_security_group" {
    type = string
  
}

variable "azurerm_network_security_rule" {
    type = map(object({
        access = string
        destination_address_prefix = string
        destination_port_range = string
        destination_port_ranges = list(string)
        direction = string
        name = string
        priority = string
        protocol = string
        source_address_prefix = string
        source_port_range = string
    }))
    default = {
      null = {
        access = null
        destination_address_prefix = null
        destination_port_range = null
        destination_port_ranges = null
        direction = null
        name = null
        priority = null
        protocol = null
        source_address_prefix = null
        source_port_range = null     
         }
    }
  
}

variable "azurerm_subnet_network_security_group_association" {
    type = map(object({
        subnet_id        = string
        
    }))
    default = {
      null = {
        subnet_id = null
                
      }
    }
  
}
