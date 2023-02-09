
 terraform {
   backend "s3" {
     bucket         = "badawi-s3-state-lock"
     key            = "terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "terraform_state"
   }
 }
