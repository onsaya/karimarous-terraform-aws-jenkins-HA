terraform{
  backend "s3" {
    encrypt  = true
  }

}

provider "aws" {
  region = "us-east-1"

}