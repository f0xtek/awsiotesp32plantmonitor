terraform {
  backend "s3" {
    bucket         = "terraform-state-355205175701-eu-west-2"
    key            = "plantmonitor/terraform.tfstate"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    region         = "eu-west-2"
    session_name   = "terraform-plantmonitor"
  }
}

provider "aws" {
  region = "eu-west-2"
}

locals {
  default_tags = {
    terraform   = true
    project     = "plantmonitor"
    environment = "dev"
  }
}

module "plantmonitor" {
  source           = "./modules/plantmonitor"
  region           = "eu-west-2"
  sns_sms_endpoint = var.sns_sms_endpoint
  tags             = local.default_tags
}
