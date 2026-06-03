resource "aws_route53_record" "example" {

  for_each = toset(var.instance)

  zone_id = var.zone_id

  name = "${each.key}.${var.domain_name}"

  type = "A"
  ttl  = 1

  records = [aws_instance.example[each.key].private_ip]

  allow_overwrite = true
}