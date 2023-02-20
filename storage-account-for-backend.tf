terraform {
  required_providers {
    azurerm = {
    }
  }
}

provider "azurerm" {
  features {}
  client_id            = var.client_id
  client_secret        = var.client_secret
  tenant_id            = var.tenant_id
  subscription_id      = var.subscription_id
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
