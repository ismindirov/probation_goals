
output "imported_certs_arns" {
  description = "Certificate's Amazon Resource Name (ARN)"
  value       = module.acm_private_certs.imported_certs_arns
}

output "created_tls_self_signed_certs_arns" {
  description = "Certificate's Amazon Resource Name (ARN)"
  value       = module.acm_private_certs.created_tls_self_signed_certs_arns
}