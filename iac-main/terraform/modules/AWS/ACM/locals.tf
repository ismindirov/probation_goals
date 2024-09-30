###########
#  Locals #
###########

locals {
  certs_keys_map               = { for cert, attr in var.self_signed_certs : cert => attr if var.self_signed_certs != null }
  certs_secrets_map            = { for cert, attr in var.certs_to_import : cert => attr if attr.encrypted != null }
  certs_chain_secrets_map      = { for cert, attr in local.certs_secrets_map : cert => attr if(attr.encrypted != null && attr.encrypted.certificate_chain != null) }
  created_certs_to_import_map  = flatten([for cert, attr in var.self_signed_certs : cert if attr.import_to_acm == true])
  existing_certs_to_import_map = { for cert, attr in var.certs_to_import : cert => attr if length(var.certs_to_import) > 0 && var.import_cert }
}
