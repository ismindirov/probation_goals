###############
# KMS secrets #
###############

data "aws_kms_secrets" "private_key" {
  for_each = var.import_cert && !var.create_cert ? local.certs_secrets_map : {}

  secret {
    name    = "private_key"
    payload = each.value.encrypted.private_key.payload
    context = each.value.encrypted.private_key.context
  }
}

data "aws_kms_secrets" "certificate_chain" {
  for_each = var.import_cert && !var.create_cert ? local.certs_chain_secrets_map : {}

  secret {
    name    = "certificate_chain"
    payload = each.value.encrypted.certificate_chain.payload
    context = each.value.encrypted.certificate_chain.context
  }
}

data "aws_kms_secrets" "certificate_body" {
  for_each = var.import_cert && !var.create_cert ? local.certs_secrets_map : {}

  secret {
    name    = "certificate_body"
    payload = each.value.encrypted.certificate_body.payload
    context = each.value.encrypted.certificate_body.context
  }
}
