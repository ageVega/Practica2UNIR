# Creamos una maquina virtual
resource "azurerm_linux_virtual_machine" "myVM1" {
  name                            = "my-first-azure-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.vm_size
  admin_username                  = "ansible"
  network_interface_ids           = [ azurerm_network_interface.myNic1.id ]
  disable_password_authentication = true
  
  # Especificamos la clave publica para el usuario administrador
  # Utilizaremos el usuario y la clave privada asociada a la publica para acceder a la VM
  admin_ssh_key {
    username   = "ansible"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  # Definimos tipo de disco y la replicacion
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Datos de la imagen a utilizar
  plan {
    name      = "hardened-ubuntu-18-04-lts-freesku"
    product   = "ubuntu-18-04-lts-free"
    publisher = "cognosys"
  }

  # La imagen tiene la sintaxis de publisher:offer:sku:version
  # cognosys:ubuntu-18-04-lts-free:hardened-ubuntu-18-04-lts-freesku:1.2019.0710
  source_image_reference {
    publisher = "cognosys"
    offer     = "ubuntu-18-04-lts-free"
    sku       = "hardened-ubuntu-18-04-lts-freesku"
    version   = "1.2019.0710"
  }

  # Storage account para almacenar la informacion de troubleshooting
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
  }

  tags = {
    environment = "CP2"
  }

}
