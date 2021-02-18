provider "aws" {
  access_key = "ASIA6M7DU3RLB26KBSVB"
  secret_key = "JclOuec+MbrwUHvLyXksnqSo01hLqqn7kvpJ2xUS"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}