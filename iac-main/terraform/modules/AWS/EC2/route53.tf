resource "aws_route53_record" "www" {
  count = (length(var.route53_record_name) > 0 && length(var.route53_record_type) > 0 && var.route53_record_ttl != null && length(var.route53_zone_id) > 0) ? 1 : 0 
  zone_id = var.route53_zone_id
  name    = var.route53_record_name
  type    = var.route53_record_type
  ttl     = var.route53_record_ttl
  records = [module.ec2_instance.private_ip]
}