terraform {
  backend "s3" {
    bucket         = "tfstate"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"

    # SeaweedFS + DynamoDB Local di VM atlantis-onprem
    endpoints = {
      s3       = "http://192.168.56.102:8333"
      dynamodb = "http://192.168.56.102:8000"
    }
    use_path_style              = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}
