data "amazon-ami" "amazonlinux" {
  filters = {
    virtualization-type = "hvm"
    name                = "al*-ami-*x86_64"
    architecture        = "x86_64"
    root-device-type    = "ebs"
  }
  owners      = ["amazon"]
  region      = lookup(var.regions, var.environment, "testing")
  most_recent = true
}
