resource "null_resource" "hello" {
  triggers = { env = var.env, version = "2" }
}
