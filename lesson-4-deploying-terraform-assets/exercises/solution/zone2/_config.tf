terraform {
   backend "s3" {
     bucket = "udacity-tf-<your_name>-west" # Replace it with your S3 bucket name
     key    = "terraform/terraform.tfstate"
     region = "us-west-1"
   }
 }

 provider "aws" {
   region = "us-west-1"
   
   default_tags {
     tags = local.tags
   }
 }