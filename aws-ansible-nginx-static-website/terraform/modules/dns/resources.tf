resource "aws_route53_zone" "domain" {
  name = "${var.domain_name}"
}

resource "aws_route53_record" "a_record_item" {
  zone_id = "${aws_route53_zone.domain.zone_id}"
  count   = "${length(var.aRecords)}"
  name    = "${element(split(" ", var.aRecords[count.index]),0)}"
  type    = "A"
  ttl     = "${var.ttl}"
  records = ["${element(split(" ", var.aRecords[count.index]),1)}"]
}

resource "aws_route53_record" "cname_record_item" {
  zone_id = "${aws_route53_zone.domain.zone_id}"
  count   = "${length(var.cnameRecords)}"
  name    = "${element(split(" ", var.cnameRecords[count.index]),0)}"
  type    = "CNAME"
  ttl     = "${var.ttl}"
  records = ["${element(split(" ", var.cnameRecords[count.index]),1)}"]
}