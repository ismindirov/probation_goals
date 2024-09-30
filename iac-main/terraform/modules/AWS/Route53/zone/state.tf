terraform {
  backend "s3" {
    bucket = "terraform-state2-ismindirov"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "erraform_locking"
  }
}
