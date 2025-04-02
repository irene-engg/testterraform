
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6.6"
}

# To create the resources in the specified region
provider "aws" {
  region = var.aws_region
}

# Create VPC
resource "aws_vpc" "vpc_test" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc_test"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_blynk.id
  tags = {
    Name = "blynk-igw"
  }
}
