provider "aws" {
  region  = "${var.region}"
  profile = "default"
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

