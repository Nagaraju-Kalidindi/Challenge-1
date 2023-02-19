terraform {
  required_providers {
    azurerm = {
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "2a57e6ab-8903-4b28-b8f5-4dea1d06cacf"
  client_secret   = "f.L8Q~Fzwv~_vt2FwdHjSJ1C2ItDy_SppVVKKbi1"
  tenant_id       = "e58c0f0a-65d3-4233-a5de-aff7128d6441"
  subscription_id = "8bd6d8f6-a228-4a56-b5ec-f213bc5f338f"
}

resource "azurerm_resource_group" "azureterraformrg" {
  name     = "azureterraformrg"
  location = "East US"
}

resource "azurerm_storage_account" "azurestorageforbackend" {
  name                     = "azurestorageforbackend"
  resource_group_name      = azurerm_resource_group.azureterraformrg.name
  location                 = azurerm_resource_group.azureterraformrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.azurestorageforbackend.name
  container_access_type = "private"
}
