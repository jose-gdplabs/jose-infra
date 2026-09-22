resource "null_resource" "name" {
  triggers = { env = "testing", version = "1" }
}