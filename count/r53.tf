resource "aws_route53_record" "example" {
    count = 10  
  zone_id = var.zone_id   # Your Hosted Zone ID
  name    = "${var.instance[count.index]}.${var.domain_name}" # mongodb.jai01.online
  type    = "A"
  ttl     = 1

  records = [aws_instance.example[count.index].private_ip]  # IP address
}