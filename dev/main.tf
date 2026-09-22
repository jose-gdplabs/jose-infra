resource "null_resource" "hello" {
  triggers = { env = "dev" }
}