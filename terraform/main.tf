# Configuramos el provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# Incluimos las credenciales (service principal)
provider "azurerm" {
  features {}
  subscription_id = "100205fa-4224-4ab8-8622-38a5c18aeff6"
  client_id = "3d58cec5-8a39-409b-8a08-a2266c5c5a51" # appID
  client_secret = "6Jl-GnPw5MshAEIY3OY9bTopdPHrVoEk.y"  # password
  tenant_id = "899789dc-202f-44b4-8472-a6d40f9eb440" # tenant
}

# Creamos un grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = "kubernetes_rg"
  location = var.location
  
  tags = {
    environment = "CP2"
  }
}

# Creamos una storage account
resource "azurerm_storage_account" "stAccount" {
  name                     = "staccountcp2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    environment = "CP2"
  }
}

