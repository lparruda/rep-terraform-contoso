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

variable "disable_password_authentication" {
  type = bool
  default = false
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "network_interfaces" {
  type = any
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "source_image_reference" {
  type = map(string)
  default = {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}
