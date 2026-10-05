terraform {
  backend "s3" {
    bucket       = "tfstate"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true

    # SeaweedFS di VM atlantis-onprem, lock = dev/terraform.tfstate.tflock di bucket yang sama
    endpoints = {
      s3 = "http://192.168.56.102:8333"
    }
    use_path_style              = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}
