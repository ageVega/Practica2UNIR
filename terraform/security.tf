# Security group VM
resource "azurerm_network_security_group" "mySecGroup" {
  name                = "sshtraffic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP2"
  }
}
# Vinculamos el security group a la interfaz de red
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  network_interface_id      = azurerm_network_interface.myNic1.id
  network_security_group_id = azurerm_network_security_group.mySecGroup.id
}

# Security group Master
resource "azurerm_network_security_group" "mySecGroupMaster" {
  name                = "sshtraffic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP2"
  }
}
# Vinculamos el security group a la interfaz de red
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  network_interface_id      = azurerm_network_interface.myNicMaster.id
  network_security_group_id = azurerm_network_security_group.mySecGroupMaster.id
}

# Security group Worker01
resource "azurerm_network_security_group" "mySecGroupWorker01" {
  name                = "sshtraffic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP2"
  }
}
# Vinculamos el security group a la interfaz de red
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  network_interface_id      = azurerm_network_interface.myNicWorker01.id
  network_security_group_id = azurerm_network_security_group.mySecGroupWorker01.id
}

# Security group Worker02
resource "azurerm_network_security_group" "mySecGroupWorker02" {
  name                = "sshtraffic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP2"
  }
}
# Vinculamos el security group a la interfaz de red
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  network_interface_id      = azurerm_network_interface.myNicWorker02.id
  network_security_group_id = azurerm_network_security_group.mySecGroupWorker02.id
}

# Security group NFS
resource "azurerm_network_security_group" "mySecGroupNFS" {
  name                = "sshtraffic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP2"
  }
}
# Vinculamos el security group a la interfaz de red
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  network_interface_id      = azurerm_network_interface.myNicNFS.id
  network_security_group_id = azurerm_network_security_group.mySecGroupNFS.id
}