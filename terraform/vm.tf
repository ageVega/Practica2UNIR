# Creamos una maquina virtual
resource "azurerm_linux_virtual_machine" "myVM1" {
  name                            = "my-first-azure-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.vm_size
  admin_username                  = "admin"
  network_interface_ids           = [ azurerm_network_interface.myNic1.id ]
  disable_password_authentication = true
  
  admin_ssh_key {
    username   = "admin"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "ubuntu-18-04-lts"
    product   = "ubuntu-1804-lts"
    publisher = "cognosys"
  }

  # La imagen tiene la sintaxis de publisher:offer:sku:version
  # cognosys:ubuntu-1804-lts:ubuntu-18-04-lts:1.2019.0710
  source_image_reference {
    publisher = "cognosys"
    offer     = "ubuntu-1804-lts"
    sku       = "ubuntu-18-04-lts"
    version   = "1.2019.0710"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
  }

  tags = {
    environment = "CP2"
  }

}