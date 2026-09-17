terraform {
  required_version = ">= 1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "message" {
  type    = string
  default = "hello from atlantis"
}

resource "local_file" "hello" {
  filename = "${path.module}/generated/hello.txt"
  content  = "${var.message}\n"
}

output "hello_path" {
  value = local_file.hello.filename
}
