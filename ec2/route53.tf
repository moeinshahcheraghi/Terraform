resource "aws_route_zone" "ayeneh-com" {
    name = "ayeneh.com"
      
}

resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.ayeneh-com.zone_id # Replace with your zone ID
  name    = "www.ayeneh.com" # Replace with your subdomain, Note: not valid with "apex" domains, e.g. example.com
  type    = "A"
  ttl     = "60"
  records = aws_instance.demo.public_ip
}