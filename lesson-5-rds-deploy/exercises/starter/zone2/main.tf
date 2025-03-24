  module "vpc" {
   source     = "./modules/vpc"
   cidr_block = "10.100.0.0/16"
   name          = "udacity-rds-west"
   azs           = ["us-west-1a", "us-west-1c"]
 }