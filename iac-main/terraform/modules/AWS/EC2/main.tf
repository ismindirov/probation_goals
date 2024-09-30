module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.name

  instance_type                        = var.instance_type
  vpc_security_group_ids               = length(var.vpc_security_group_ids) > 0 ? var.vpc_security_group_ids : data.aws_security_groups.test.ids # ["sg-07a9ee016fb9c1b85"]
  subnet_id                            = var.subnet_id == null ? data.aws_subnets.available.ids[0] : var.subnet_id  # "subnet-0372b096bb026bc80" 
  associate_public_ip_address          = var.associate_public_ip_address
  private_ip                           = var.private_ip
  iam_role_permissions_boundary        = var.iam_role_permissions_boundary
  cpu_threads_per_core                 = var.cpu_threads_per_core
  disable_api_stop                     = var.disable_api_stop
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  get_password_data                    = var.get_password_data
  host_id                              = var.host_id
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_tags                        = var.instance_tags
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  key_name                             = var.key_name
  launch_template                      = var.launch_template
  metadata_options                     = var.metadata_options
  monitoring                           = var.monitoring
  network_interface                    = var.network_interface
  private_dns_name_options             = var.private_dns_name_options
  placement_group                      = var.placement_group
  root_block_device                    = var.root_block_device
  secondary_private_ips                = var.secondary_private_ips
  source_dest_check                    = var.source_dest_check
  tenancy                              = var.tenancy
  user_data                            = var.user_data
  user_data_base64                     = var.user_data_base64
  user_data_replace_on_change          = var.user_data_replace_on_change
  volume_tags                          = var.volume_tags
  enable_volume_tags                   = var.enable_volume_tags
  timeouts                             = var.timeouts
  cpu_options                          = var.cpu_options
  cpu_core_count                       = var.cpu_core_count
  create_spot_instance                 = var.create_spot_instance
  spot_price                           = var.spot_price
  spot_wait_for_fulfillment            = var.spot_wait_for_fulfillment
  spot_type                            = var.spot_type
  spot_launch_group                    = var.spot_launch_group
  spot_block_duration_minutes          = var.spot_block_duration_minutes
  spot_instance_interruption_behavior  = var.spot_instance_interruption_behavior
  spot_valid_until                     = var.spot_valid_until
  spot_valid_from                      = var.spot_valid_from
  putin_khuylo                         = var.putin_khuylo
  create_iam_instance_profile          = var.create_iam_instance_profile
  iam_role_name                        = var.iam_role_name
  iam_role_use_name_prefix             = var.iam_role_use_name_prefix
  iam_role_path                        = var.iam_role_path
  iam_role_description                 = var.iam_role_description
  iam_role_policies                    = var.iam_role_policies
  iam_role_tags                        = var.iam_role_tags


  tags = var.tags
}
