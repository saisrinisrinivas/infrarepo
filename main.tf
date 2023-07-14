terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region_name
}


module "ecr" {
  source = "./modules/ecr"

  name                  = "nginx"
  project_family        = "demoecr"
  environment           = "dev"
  image_tag_mutability  = "MUTABLE"
  scan_on_push          = true
  expiration_after_days = 7
  additional_tags = {
    Project     = "ECRDemo"
    Owner       = "anotherbuginthecode"
    Purpose     = "Reverse Proxy"
    Description = "NGINX docker image"
  }
}
