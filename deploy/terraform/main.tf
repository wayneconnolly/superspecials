provider "azurerm" {
    features {}
}
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
data "azurerm_client_config" "current" {}

#Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.location
}

#Create Storage account
resource "azurerm_storage_account" "storage_account" {
  name                = var.storage_account
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

#Add index.html to blob storage
resource "azurerm_storage_blob" "site" {
  name                   = "index.html"
  storage_account_name   = azurerm_resource_group.site.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "index.html"
}