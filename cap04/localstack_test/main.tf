provider "aws" {
  region     = "us-east-1"
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

resource "aws_instance" "tarefa1" {
  ami           = "ami-0a0d9cf81c479446a"  # AMI na AWS
  instance_type = "t2.micro"

  tags = {
    Name = "lab1-terraform"
  }
}
