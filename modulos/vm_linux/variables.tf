variable "resource_group_name" {
  type = string

}
variable "local" {
  type = string

}
variable "vm_name" {
  type = string

}
variable "size" {
  type = string

}
variable "admin_username" {
  type = string

}

variable "admin_password" {
  type = string

}
variable "azurerm_virtual_network" {
  type    = string
  default = null

}
variable "azurerm_subnet" {
  type    = string
  default = null

}
variable "os_disk_caching" {
  type = string
  
}
variable "os_disk_storage_account_type" {
  type = string
  
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer = string
    sku = string
    version = string
  })
  default = {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"

  }
}







variable "disable_password_authentication" {
  type = bool

}
variable "network_interface_name" {
    type = string
    default = null
}
variable "ip_configuration" {
    type = map(object({
    name                          = string
    subnet_id                     = string
    private_ip_address_allocation = string
    }))
    default = {
      "null" = {
        name = null
        private_ip_address_allocation = null
        subnet_id = null
      }
    }
    
  
}


variable "network_interfaces" {
  type = map(object({
    ip_configuration_name         = string
    subnet_id                     = string
    private_ip_address_allocation = string
    private_ip_address            = string
    primary                       = string

  }))
  default = {
    "null" = {
      ip_configuration_name         = null
      subnet_id                     = null
      private_ip_address_allocation = null
      private_ip_address            = null
      primary                       = null

    }
  }

}
variable "tags" {
type = map
default = {
  area = "infraestrutura"
  deployedby = "Terraform"
  environment = "prd"
  project = "Projeto | Contoso"
  provider = "azr"
  region = "brazilsouth"
}

}








