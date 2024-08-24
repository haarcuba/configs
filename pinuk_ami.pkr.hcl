packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "pinukei-hashual"
  instance_type = "m3.xlarge"
  region        = "us-east-1"
  source_ami = "ami-0e86e20dae9224db8"
  ssh_username = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y git rake",
      "git clone https://github.com/haarcuba/configs.git",
      "cd configs ; rake all",
    ]
  }
}
