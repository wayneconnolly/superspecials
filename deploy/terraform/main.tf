terraform {
  required_version = ">= 0.11"

  backend "azurerm" {}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {}

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "superspecials" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}

# Create a Storage Account and enable Static website hosting
resource "azurerm_storage_account" "superspecials" {
  name                     = "${var.dns_name}"
  location                 = "${azurerm_resource_group.superspecials.location}"
  resource_group_name      = "${azurerm_resource_group.superspecials.name}"
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

   provisioner "local-exec" {
    command = "az storage blob service-properties update --account-name ${azurerm_storage_account.superspecials} --static-website  --index-document index.html --404-document 404.html"
  }
}

