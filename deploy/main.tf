terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.55.0"
    }
  }
  backend "s3" {
    bucket         = "recipe-app-api-devops-tfstate-juliazuin2"
    key            = "recipe-app.tfstate"
    region         = "sa-east-1"
    encrypt        = true
    dynamodb_table = "recipe-app-api-devops-tf-state-lock"
  }
}

provider "aws" {
  region = "sa-east-1"
}

data "aws_region" "current" {

}
