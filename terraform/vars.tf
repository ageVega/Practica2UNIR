variable "location" {
  type = string
  description = "Region de Azure donde creamos la infraestructura"
  default = "West Europe"
}

variable "vm_size" {
  type = string
  description = "Tamaño de la maquina virtual"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU
}
#  {
#    "maxDataDiskCount": 4,
#    "memoryInMb": 3584,
#    "name": "Standard_D1_v2",
#    "numberOfCores": 1,
#    "osDiskSizeInMb": 1047552,
#    "resourceDiskSizeInMb": 51200
#  },
#  {
#    "maxDataDiskCount": 4,
#    "memoryInMb": 4096,
#    "name": "Standard_B2s",
#    "numberOfCores": 2,
#    "osDiskSizeInMb": 1047552,
#    "resourceDiskSizeInMb": 8192
#  },
#  {
#    "maxDataDiskCount": 4,
#    "memoryInMb": 8192,
#    "name": "Standard_B2ms",
#    "numberOfCores": 2,
#    "osDiskSizeInMb": 1047552,
#    "resourceDiskSizeInMb": 16384
#  },