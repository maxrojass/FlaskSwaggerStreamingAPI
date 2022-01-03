
provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

module "security_module" {
  source = "./terraform-security"
}

module "ec2_module" {
  source = "./terraform-ec2-VM"
}


module "datastream_module" {
  source = "./terraform-DataStream"
}