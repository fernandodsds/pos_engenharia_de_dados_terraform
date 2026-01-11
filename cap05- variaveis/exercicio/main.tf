variable "instance_type" {
  description = "O tipo de instância a ser criada"
}

variable "ami" {
  description = "A Amazon Machine Image (AMI) a ser usada pela instância"
}

variable "region" {
  description = "A região AWS onde a instância será criada"
  default     = "us-east-2"
}

provider "aws" {
  region     = var.region
  access_key = "test"
  secret_key = "test"

  # Configurações obrigatórias para LocalStack
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3             = "http://localstack:4566"
    dynamodb       = "http://localstack:4566"
    lambda         = "http://localstack:4566"
    ec2            = "http://localstack:4566"
    # Adicione outros serviços conforme necessário
  }
}

resource "aws_instance" "tarefa2" {
  ami           = var.ami # AMI na AWS
  instance_type = var.instance_type

  tags = {
    Name = "lab2-terraform"
  }
}
