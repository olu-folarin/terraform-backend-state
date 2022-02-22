terraform {
    required_providers {
        "aws" = {
            soure = "hashicorp/aws"
            version = "~> 3.4"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

// create an s3 bucket where the states of different projecta can be stored with different ids
provider "aws_s3_bucket" "backend_bucket" {
    bucket = ""
}

// lock the state with Dynamo DB to prevent any team member from tampering from it