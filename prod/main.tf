resource "null_resource" "hello"{
    triggers = { env = "prod"}
}