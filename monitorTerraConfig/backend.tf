terraform {
  backend "s3" {
    bucket = "terra-bucket-23"
    key    = "nike-monitor/terraform.tfstate"
    region = "us-east-1"
  }
}