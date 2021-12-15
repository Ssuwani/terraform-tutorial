terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "suwan"

    workspaces {
      name = "gh-actions"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "test" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

resource "aws_security_group" "instance" {
	name = "terraform-example-instance"

	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_bolcks = ["0.0.0.0/0"]
	}

}