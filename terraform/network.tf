# Creacion de red
resource "azurerm_virtual_network" "myNet" {
  name                = "kubernetesnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = "CP2"
  }
}

# Creacion de subred
resource "azurerm_subnet" "mySubnet" {
  name                 = "terraformsubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# IP publica VM
resource "azurerm_public_ip" "myPublicIp1" {
  name                = "vmip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }
}
# IP publica Master
resource "azurerm_public_ip" "myPublicIpMaster" {
  name                = "vmipmaster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }
}
# IP publica Worker01
resource "azurerm_public_ip" "myPublicIpWorker01" {
  name                = "vmipworker01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }
}
# IP publica Worker02
resource "azurerm_public_ip" "myPublicIpWorker02" {
  name                = "vmipworker02"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }
}
# IP publica NFS
resource "azurerm_public_ip" "myPublicIpNFS" {
  name                = "vmipnfs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }
}

# Creacion de NIC VM
resource "azurerm_network_interface" "myNic1" {
  name                = "vmnic1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "myipconfiguration1"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.20"
    public_ip_address_id          = azurerm_public_ip.myPublicIp1.id
  }

  tags = {
    environment = "CP2"
  }
}

# Creacion de NIC Master
resource "azurerm_network_interface" "myNicMaster" {
  name                = "vmnicmaster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "myipconfigurationmaster"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.myPublicIpMaster.id
  }

  tags = {
    environment = "CP2"
  }
}
# Creacion de NIC Worker01
resource "azurerm_network_interface" "myNicWorker01" {
  name                = "vmnicworker01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "myipconfigurationworker01"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.11"
    public_ip_address_id          = azurerm_public_ip.myPublicIpWorker01.id
  }

  tags = {
    environment = "CP2"
  }
}
# Creacion de NIC Worker02
resource "azurerm_network_interface" "myNicWorker02" {
  name                = "vmnicworker02"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "myipconfigurationworker02"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.12"
    public_ip_address_id          = azurerm_public_ip.myPublicIpWorker02.id
  }

  tags = {
    environment = "CP2"
  }
}
# Creacion de NIC NFS
resource "azurerm_network_interface" "myNicNFS" {
  name                = "vmnicnfs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  ip_configuration {
    name                          = "myipconfigurationnfs"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.15"
    public_ip_address_id          = azurerm_public_ip.myPublicIpNFS.id
  }

  tags = {
    environment = "CP2"
  }
}