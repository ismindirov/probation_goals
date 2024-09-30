# =================== #
# ACM Certificates    #
# =================== #

resource "aws_acm_certificate" "cert_to_import" {
  for_each = var.import_cert ? local.existing_certs_to_import_map : {}

  private_key       = each.value.encrypted != null ? data.aws_kms_secrets.private_key[each.key].plaintext["private_key"] : each.value.plaintext.private_key
  certificate_body  = each.value.encrypted != null ? data.aws_kms_secrets.certificate_body[each.key].plaintext["certificate_body"] : each.value.plaintext.certificate_body
  certificate_chain = each.value.encrypted != null ? (each.value.encrypted.certificate_chain != null ? data.aws_kms_secrets.certificate_chain[0].plaintext["certificate_chain"] : "") : (each.value.plaintext != null ? (each.value.plaintext.certificate_chain != null ? each.value.plaintext.certificate_chain : "") : "")

}

resource "aws_acm_certificate" "created_tls_self_signed_cert" {
  for_each = var.create_cert && local.created_certs_to_import_map != null ? toset(local.created_certs_to_import_map) : []

  private_key      = tls_private_key.this[each.value].private_key_pem
  certificate_body = tls_self_signed_cert.this[each.value].cert_pem
}

resource "tls_self_signed_cert" "this" {
  for_each = var.create_cert && var.self_signed_certs != null ? local.certs_keys_map : {}

  private_key_pem = tls_private_key.this[each.key].private_key_pem
  key_algorithm   = var.generate_tls_private_key.algorithm

  subject {
    common_name  = each.value.subject.common_name
    organization = each.value.subject.organization
  }

  validity_period_hours = each.value.validity_period_hours
  early_renewal_hours   = each.value.early_renewal_hours
  allowed_uses          = each.value.allowed_uses
  dns_names             = each.value.dns_names
}

resource "tls_private_key" "this" {
  for_each = var.create_cert && var.generate_tls_private_key.create ? local.certs_keys_map : {}

  algorithm = var.generate_tls_private_key.algorithm
  rsa_bits  = var.generate_tls_private_key.rsa_bits
}
