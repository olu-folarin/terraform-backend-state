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
resource "aws_s3_bucket" "backend_bucket" {
    bucket = "dev-applications-backend-state-olufolarin"

    // add lifecycle to prevent the deletion of the bucket
    lifecycle {
        prevent_destroy = true
    }

    // enable versioning in order to store multiple versions of the state
    versioning {
        enabled = true
    }

    // encrypt then store the bucket in a server
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

// lock the state with Dynamo DB to prevent any team member from tampering from it
resource "aws_dynamodb_table" "backend_state_lock" {
    
}