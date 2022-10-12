resource azurerm_resource_group "resource_group"{
name = "rgbyme1234"
location = "eastus"
}

resource "azurerm_storage_account" "storage_account"{
name = "storagebyme1234"
location = "centralus"
resource_group_name = "rgbyme1234"
account_tier = "Standard"
account_replication_type = "LRS"
}
provider "azurerm" {
    features {}
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "vnetbyme1234"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "rgbyme1234"
}
resource "azurerm_subnet" "subnet" {
  name                 = "mysubnetbyme1235"
  resource_group_name  = "rgbyme1234"
  virtual_network_name = "vnetbyme1234"
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_interface" "network_interface" {
  name                = "nicbyme1234"
  location            = "eastus"
  resource_group_name = "rgbyme1234"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_windows_virtual_machine" "virtual_machine" {
  name                = "vmbyme1234"
  resource_group_name = "rgbyme1234"
  location            = "eastus"
  size                = "Standard_B2s"
  admin_username      = "narenbyme1234"
  admin_password      = "Dheeraj@3210"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}