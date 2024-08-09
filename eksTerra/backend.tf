terraform {
  backend "s3" {
    bucket = "terra-bucket-23"
    key    = "eks-nike/terraform.tfstate"
    region = "us-east-1"
  }
}