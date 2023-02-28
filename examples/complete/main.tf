terraform {
  required_version = ">= 1.3.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "elasticsearch-cluster" {
#  source = "Datomni/elasticsearch-cluster/aws"
  source = "git::https://github.com/Datomni/terraform-aws-elasticsearch-cluster.git?ref=dev"

  domain_name     = var.domain_name
  master_user     = var.master_user
  master_password = var.master_password
}
