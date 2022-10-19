resource azurerm_resource_group "resource_group"{
name = "rg_name"
location = "eastus"
}

resource "azurerm_storage_account" "storage_account"{
name = "storage_name"
location = "eastus"
resource_group_name = "rg_name"
account_tier = "Standard"
account_replication_type = "LRS"
}
provider "azurerm" {
    features {}
}
resource "azurerm_storage_share" "file_share" {
  name                 = "fileshare_name"
  storage_account_name = "storage_name"
  quota                = 50
}
