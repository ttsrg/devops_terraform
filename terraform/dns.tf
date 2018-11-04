resource "aws_route53_record" "calc_www" {
  zone_id = "${var.zone_id}"
  name    = "calc.bkmz.srwx.net"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}
