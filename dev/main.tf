resource "null_resource" "hello"{
    triggers = { env = "dev", coba = "2"}
}