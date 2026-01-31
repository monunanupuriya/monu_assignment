resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "mk-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_L2aos_v4"
  admin_username        = "adminuser"
  admin_password        = "adminuser@123456"
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false

  #   admin_ssh_key {
  #     username   = "adminuser"
  #     public_key = file("~/.ssh/id_rsa.pub")
  #   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}