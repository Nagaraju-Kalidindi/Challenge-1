resource "azurerm_resource_group" "azure-terraform-rs" {
  name     = var.name
  location = var.location
}
