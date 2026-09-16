terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {
    virtual_machine {
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = true
    }
  }
  use_oidc = true
}
