data "aws_subnets" "available" {
  filter {
    name   = "state"
    values = ["available"] # insert values here
  }
}

data "aws_security_groups" "test" { 
  filter {
    name   = "group-name"
    values = ["docker-nginx"]
  }
}
