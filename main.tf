terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
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

// resource "aws_instance" "test" {
//   ami                    = "ami-0c55b159cbfafe1f0"
//   instance_type          = "t2.micro"
//   vpc_security_group_ids = [aws_security_group.instance.id]

//   tags = {
//     Name = "HelloWorld"
//   }
//   user_data = <<-EOF
//               #!/bin/bash
//               echo "Hello, World" > index.html
//               nohup busybox httpd -f -p ${var.server_port} &
//               EOF
// }

// resource "aws_security_group" "instance" {
//   name = "terraform-example-instance"

//   ingress {
//     from_port   = var.server_port
//     to_port     = var.server_port
//     protocol    = "tcp"
//     cidr_blocks = ["0.0.0.0/0"]
//   }
// }

// variable "server_port"{
//   description = "The port the server will use for HTTP requests"
//   type = number
//   default = 8080
// }
