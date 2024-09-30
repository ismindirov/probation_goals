###########
# Outputs #
###########

output "imported_certs_arns" {
  description = "The Amazon Resource Name (ARN) of the env cert."
  value       = try({ for cert, value in aws_acm_certificate.cert_to_import : cert => value.arn }, "")
}

output "created_tls_self_signed_certs_arns" {
  description = "The Amazon Resource Name (ARN) of the env cert."
  value       = try({ for cert, value in aws_acm_certificate.created_tls_self_signed_cert : cert => value.arn }, "")
}
