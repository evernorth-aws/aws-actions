provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_s3_bucket" "demo" {
  bucket        = "gh-actions-demo-${random_id.suffix.hex}"
  force_destroy = true
}

resource "random_id" "suffix" {
  byte_length = 4
}

output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}
