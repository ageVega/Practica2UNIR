output "ipVM" {
    value = azurerm_public_ip.myPublicIp1.ip_address
}
output "ipMaster" {
    value = azurerm_public_ip.myPublicIpMaster.ip_address
}

output "ipWorker01" {
    value = azurerm_public_ip.myPublicIpWorker01.ip_address
}

output "ipWorker02" {
    value = azurerm_public_ip.myPublicIpWorker02.ip_address
}

output "ipNFS" {
    value = azurerm_public_ip.myPublicIpNFS.ip_address
}
