packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}
source "amazon-ebs" "packerami" {
  region        = lookup(var.regions, var.environment, "testing")
  ami_name      = local.ami_name
  instance_type = var.instance_type
  source_ami    = local.source_ami_id
  ssh_username  = "ec2-user"

}
build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.packerami"
  ]
  provisioner "shell" {
    script          = "./setup.sh"
    execute_command = "sudo {{.Path}}"
  }
}
