resource "aws_security_group" "custom_sg" {
  name        = "custom_sg"
  description = "Custom_sg"
  vpc_id      = "vpc-034528d2a7f5f2ea9"

  tags = {
    Name = "custom_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "custom_sg_ipv4" {
  security_group_id = aws_security_group.custom_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.custom_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
