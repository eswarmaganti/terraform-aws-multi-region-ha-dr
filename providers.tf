terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
  backend "s3" {
    bucket         = "aws-multi-region-ha-dr"
    dynamodb_table = "terraform_lock"
    region         = "us-east-1"
    key            = "aws-multi-region-ha-dr/terraform.tfstate"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
  alias   = "ap"
}
