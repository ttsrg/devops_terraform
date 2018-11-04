resource "aws_security_group" "calc_web" {
  name = "sg_calc_web"
  description = "security group for calc app"
  # ingress = {
  #   from_port           = "0"
  #   to_port             = "40"
  #   protocol            = "icmp"
  #   cidr_blocks         = ["0.0.0.0/0"]
  # }
}

resource "aws_security_group" "calc_api" {
  name = "sg_calc_api"
  description = "security group for calc api"
  # ingress = {
  #   from_port           = "8"
  #   to_port             = "8"
  #   protocol            = "icmp"
  #   cidr_blocks         = ["0.0.0.0/0"]
  # }
}

resource "aws_security_group_rule" "ingress_ports_mgmnt_web" {
    type                = "ingress"
    count               = "${length(var.allowed_mgmnt_ports)}"
    security_group_id   = "${aws_security_group.calc_web.id}"
    from_port           = "${element(var.allowed_mgmnt_ports, count.index)}"
    to_port             = "${element(var.allowed_mgmnt_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = "${var.allowed_mgmnt_address}"
}

resource "aws_security_group_rule" "egress_ports_mgmnt_web" {
    type                = "egress"
    count               = "${length(var.allowed_mgmnt_ports)}"
    security_group_id   = "${aws_security_group.calc_web.id}"
    from_port           = "${element(var.allowed_mgmnt_ports, count.index)}"
    to_port             = "${element(var.allowed_mgmnt_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = "${var.allowed_mgmnt_address}"
}

resource "aws_security_group_rule" "ingress_ports_mgmnt_api" {
    type                = "ingress"
    count               = "${length(var.allowed_mgmnt_ports)}"
    security_group_id   = "${aws_security_group.calc_api.id}"
    from_port           = "${element(var.allowed_mgmnt_ports, count.index)}"
    to_port             = "${element(var.allowed_mgmnt_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = "${var.allowed_mgmnt_address}"
}

resource "aws_security_group_rule" "egress_ports_mgmnt_api" {
    type                = "egress"
    count               = "${length(var.allowed_mgmnt_ports)}"
    security_group_id   = "${aws_security_group.calc_api.id}"
    from_port           = "${element(var.allowed_mgmnt_ports, count.index)}"
    to_port             = "${element(var.allowed_mgmnt_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = "${var.allowed_mgmnt_address}"
}

resource "aws_security_group_rule" "ingress_ports_web" {
    type                = "ingress"
    count               = "${length(var.allowed_ports_web)}"
    security_group_id   = "${aws_security_group.calc_web.id}"
    from_port           = "${element(var.allowed_ports_web, count.index)}"
    to_port             = "${element(var.allowed_ports_web, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_ports_web" {
    type                = "egress"
    count               = "${length(var.allowed_ports_web)}"
    security_group_id   = "${aws_security_group.calc_web.id}"
    from_port           = "${element(var.allowed_ports_web, count.index)}"
    to_port             = "${element(var.allowed_ports_web, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_ports_api" {
    type                = "ingress"
    count               = "${length(var.allowed_ports_api)}"
    security_group_id   = "${aws_security_group.calc_api.id}"
    from_port           = "${element(var.allowed_ports_api, count.index)}"
    to_port             = "${element(var.allowed_ports_api, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["${aws_instance.web.public_ip}/32"]
}

resource "aws_security_group_rule" "egress_ports_api" {
    type                = "egress"
    count               = "${length(var.allowed_ports_api)}"
    security_group_id   = "${aws_security_group.calc_api.id}"
    from_port           = "${element(var.allowed_ports_api, count.index)}"
    to_port             = "${element(var.allowed_ports_api, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["${aws_instance.web.public_ip}/32"]
}
