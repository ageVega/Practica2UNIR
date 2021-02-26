output "ipMaster" {
    value = azurerm_public_ip.myPublicIpMaster.ip_address
}

output "ipWorker01" {
    value = azurerm_public_ip.myPublicIpWorker01.ip_address
}
