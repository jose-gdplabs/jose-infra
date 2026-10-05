include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Terragrunt jalanin terraform di .terragrunt-cache/, bukan di folder ini.
# "//" = salin seluruh repo ke cache lalu jalan di subfolder dev,
# biar source = "../modules/hello" di main.tf tetap ketemu.
terraform {
  source = "${get_repo_root()}//dev"
}
