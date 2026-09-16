variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "local" {
  type        = string
  description = "Regiao Azure"
}

variable "vm_name" {
  type        = string
  description = "Nome da VM Windows"
}

variable "size" {
  type        = string
  default     = "Standard_D2s_v5"
  description = "Tamanho da VM"
}

variable "admin_username" {
  type        = string
  default     = "azroot"
  description = "Usuario administrador"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Senha do administrador"
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "network_interfaces" {
  type = map(object({
    ip_configuration_name         = string
    private_ip_address_allocation = string
    private_ip_address            = string
    primary                       = bool
    subnet_id                     = string
    public_ip_address_id          = string
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}
