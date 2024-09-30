module "acm_private_certs" {
  source = "../../"

  # Import existing issued or self-signed cert. Disabled in this example
  import_cert     = false
  certs_to_import = {}
  aws_region = "us-east-1"


  # Create tls self signed cert and import to acm
  create_cert = true

  self_signed_certs = {
    gitlab-self-issued = {
      import_to_acm = true # will be imported to AWS ACM
      subject = {
        common_name  = "ismindirov RSA 2048"
        organization = "ismindirov"
      }
      validity_period_hours = 8760
      early_renewal_hours   = 120
      allowed_uses          = ["key_encipherment", "digital_signature", "server_auth"]
      dns_names             = ["*.ismindirov.com"]
    }
    # aws-prod-security = {
    #   import_to_acm = false # won't be imported to AWS ACM
    #   subject = {
    #     common_name  = "Growe self-signed RSA 2048"
    #     organization = "Growe"
    #   }
    #   validity_period_hours = 8760
    #   early_renewal_hours   = 120
    #   allowed_uses          = ["key_encipherment", "digital_signature", "server_auth"]
    #   dns_names             = ["gitlab.euc1.prod-infra.aws.tech-ops.cloud"]
    # }
  }

  # Generation of TLS private key for self_signed_cert. Uniq tls private will be generated per each certificate
  generate_tls_private_key = {
    create    = true
    algorithm = "RSA"
    rsa_bits  = 2048
  }
}