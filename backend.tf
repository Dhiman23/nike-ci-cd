terraform {
  backend "s3" {
    bucket = "terra-bucket-23"
    key    = "nike-app/terraform.tfstate"
    region = "us-east-1"
  }
}