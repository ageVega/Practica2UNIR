#provider "aws" {
#  region  = "${var.region}"
#  profile = "default"
#}

provider "azurerm" {
  features {}
  subscription_id = "100205fa-4224-4ab8-8622-38a5c18aeff6"
  client_id = "3d58cec5-8a39-409b-8a08-a2266c5c5a51" # appID
  client_secret = "6Jl-GnPw5MshAEIY3OY9bTopdPHrVoEk.y"  # password
  tenant_id = "899789dc-202f-44b4-8472-a6d40f9eb440" # tenant
}

resource "aws_instance" "another" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  tags = {
    "Name" = "unir-ec2-example02"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  tags = {
    "Name" = "unir-ec2-example01"
  }
  
  //Tambien es posible el uso de remote-exec o connection para conectar con maquinas virtuales remotas
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}

