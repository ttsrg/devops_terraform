resource "aws_instance" "web" {
  ami             = "ami-0ac019f4fcb7cb7e6"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.key_pair.key_name}"
  security_groups = ["${aws_security_group.calc_web.name}"]

  tags {
    Name = "calc_web"
  }

  # provisioner "local-exec" {
  #   command = "ansible-playbook -i ../ansible/inventory/stage ../ansible/calc_web.yml"
  # }

}

resource "aws_instance" "api" {
  ami             = "ami-0ac019f4fcb7cb7e6"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.key_pair.key_name}"
  security_groups = ["${aws_security_group.calc_api.name}"]

  tags {
    Name = "calc_api"
  }
}
