module "my-ec2-module" {
  source = "../../"
  name = "practice-ec2"
  route53_zone_id = "Z0994048M8YBADMW0ZES"
  route53_record_name = "ec2.ismindirov.com"
  route53_record_ttl = 300
  route53_record_type = "A"
}

