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

