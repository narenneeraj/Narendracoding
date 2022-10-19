resource azurerm_resource_group "resource_group"{
name = "rg1212"
location = "eastus"
}

resource "azurerm_storage_account" "storage_account"{
name = "storage1213"
location = "eastus"
resource_group_name = "rg1212"
account_tier = "Standard"
account_replication_type = "LRS"
}
provider "azurerm" {
    features {}
}
resource "azurerm_storage_share" "file_share" {
  name                 = "fileshares1213"
  storage_account_name = "storage1213"
  quota                = 50
}
