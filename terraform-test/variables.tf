variable "ami_id" {
  default = "ami-b374d5a5"
}

variable "instance_type" {
  description = "Tipo de instancia a levantar en AWS. Por defecto es t2.micro. Si se quedase corta, se podría ampliar a t2.small o t2.medium"
  default     = "t2.micro"
}

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "myip" {
  description = "A continuación indicar la IP desde donde se va a conectar al servidor web y la instancia ec2"
}