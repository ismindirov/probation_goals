output "id" {
  description = "The ID of the instance"
  value       = module.ec2_instance.id
}

output "arn" {
  description = "The ARN of the instance"
  value       = module.ec2_instance.arn
}

output "instance_state" {
  description = "The state of the instance"
  value       = module.ec2_instance.instance_state
}

output "outpost_arn" {
  description = "The ARN of the Outpost the instance is assigned to"
  value       = module.ec2_instance.outpost_arn
}

output "password_data" {
  description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if `get_password_data` is true"
  value       = module.ec2_instance.password_data
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_instance.primary_network_interface_id
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_instance.private_dns
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_instance.public_dns
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_instance.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value       = module.ec2_instance.private_ip
}

output "ipv6_addresses" {
  description = "The IPv6 address assigned to the instance, if applicable"
  value       = module.ec2_instance.ipv6_addresses
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.ec2_instance.tags_all
}

# output "spot_bid_status" {
#   description = "The current bid status of the Spot Instance Request"
#   value       = try(aws_spot_instance_request.this[0].spot_bid_status, null)
# }

# output "spot_request_state" {
#   description = "The current request state of the Spot Instance Request"
#   value       = try(aws_spot_instance_request.this[0].spot_request_state, null)
# }

# output "spot_instance_id" {
#   description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request"
#   value       = try(aws_spot_instance_request.this[0].spot_instance_id, null)
# }

# output "ami" {
#   description = "AMI ID that was used to create the instance"
#   value = try(
#     aws_instance.this[0].ami,
#     aws_instance.ignore_ami[0].ami,
#     aws_spot_instance_request.this[0].ami,
#     null,
#   )
# }

# output "availability_zone" {
#   description = "The availability zone of the created instance"
#   value = try(
#     aws_instance.this[0].availability_zone,
#     aws_instance.ignore_ami[0].availability_zone,
#     aws_spot_instance_request.this[0].availability_zone,
#     null,
#   )
# }

# ################################################################################
# # IAM Role / Instance Profile
# ################################################################################

# output "iam_role_name" {
#   description = "The name of the IAM role"
#   value       = try(aws_iam_role.this[0].name, null)
# }

# output "iam_role_arn" {
#   description = "The Amazon Resource Name (ARN) specifying the IAM role"
#   value       = try(aws_iam_role.this[0].arn, null)
# }

# output "iam_role_unique_id" {
#   description = "Stable and unique string identifying the IAM role"
#   value       = try(aws_iam_role.this[0].unique_id, null)
# }

# output "iam_instance_profile_arn" {
#   description = "ARN assigned by AWS to the instance profile"
#   value       = try(aws_iam_instance_profile.this[0].arn, null)
# }

# output "iam_instance_profile_id" {
#   description = "Instance profile's ID"
#   value       = try(aws_iam_instance_profile.this[0].id, null)
# }

# output "iam_instance_profile_unique" {
#   description = "Stable and unique string identifying the IAM instance profile"
#   value       = try(aws_iam_instance_profile.this[0].unique_id, null)
# }

# ################################################################################
# # Block Devices
# ################################################################################
# output "root_block_device" {
#   description = "Root block device information"
#   value = try(
#     aws_instance.this[0].root_block_device,
#     aws_instance.ignore_ami[0].root_block_device,
#     aws_spot_instance_request.this[0].root_block_device,
#     null
#   )
# }

# output "ebs_block_device" {
#   description = "EBS block device information"
#   value = try(
#     aws_instance.this[0].ebs_block_device,
#     aws_instance.ignore_ami[0].ebs_block_device,
#     aws_spot_instance_request.this[0].ebs_block_device,
#     null
#   )
# }

# output "ephemeral_block_device" {
#   description = "Ephemeral block device information"
#   value = try(
#     aws_instance.this[0].ephemeral_block_device,
#     aws_instance.ignore_ami[0].ephemeral_block_device,
#     aws_spot_instance_request.this[0].ephemeral_block_device,
#     null
#   )
# }
