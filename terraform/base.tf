provider "aws" {
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
  region     = "us-east-1"
}

## Define ssh_keys for instance

resource "aws_key_pair" "key_pair" {
  key_name    = "${lower(var.name)}-key_pair-${lower(var.environment)}"
  public_key  = "${file("${var.ssh_key_path}")}"
}
