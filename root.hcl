# Config bersama buat semua folder yang pakai terragrunt (sekarang: dev).
# Tiap folder cukup punya terragrunt.hcl yang include file ini.
remote_state {
  backend = "s3"

  # Terragrunt nulis blok backend ini jadi file .tf di folder anak sebelum manggil terraform
  generate = {
    path      = "terragrunt_backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket       = "tfstate"
    key          = "${path_relative_to_include()}/terraform.tfstate" # dev/terraform.tfstate
    region       = "us-east-1"
    use_lockfile = true

    # SeaweedFS di VM atlantis-onprem
    endpoints = {
      s3 = "http://192.168.56.102:8333"
    }
    use_path_style              = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    # Khusus terragrunt: jangan coba setting versioning/enkripsi/policy bucket lewat API AWS,
    # SeaweedFS belum tentu dukung semuanya dan bucket-nya udah ada
    skip_bucket_versioning             = true
    skip_bucket_ssencryption           = true
    skip_bucket_root_access            = true
    skip_bucket_enforced_tls           = true
    skip_bucket_public_access_blocking = true
    disable_bucket_update              = true
  }
}
