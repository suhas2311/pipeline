 terraform {
    required_version = ">= 0.15.1"
    required_providers {
        aws = {
            version = "= 4.32.0"
        }
    }

    backend "s3" {
        bucket = "s4-backend-bucket-985687654867"
        key    = "project1/terraform.tfstate"
        region = "ap-south-1"
    }
 }