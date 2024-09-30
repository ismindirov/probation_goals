##############
#  Mandatory #
##############

variable "certs_to_import" {
  description = "Certificates data for import. Can be provided by encrypted or by plaintext. Private key and cert can be encrypted by existing kms key and provided as an encrypted PAYLOAD (KMS key should exist to decrypt provided payloads/secrets)."
  type = map(object({
    encrypted = optional(object({
      private_key = optional(object({
        payload = string
        context = map(string)
      }), null)
      certificate_body = optional(object({
        payload = string
        context = map(string)
      }), null)
      certificate_chain = optional(object({
        payload = optional(string, null)
        context = optional(map(string), null)
      }), null)
    }), null)
    plaintext = optional(object({
      private_key       = string
      certificate_body  = string
      certificate_chain = optional(string, null)
    }), null)
  }))
}

##############
#  Optional  #
##############

variable "aws_region" {
  description = "AWS region to be deployed for"
  type        = string
  default     = "eu-central-1"
}

variable "import_cert" {
  description = "To import existing certs"
  type        = bool
  default     = true
}


variable "create_cert" {
  description = "Create self-signed not trusted cert"
  type        = bool
  default     = false
}

variable "self_signed_certs" {
  description = "Creation of TLS self signed certs"
  type = map(object({
    private_key_pem = optional(string, null)
    import_to_acm   = optional(bool, true)
    subject = object({
      common_name  = optional(string, "Growe self-signed RSA 4096")
      organization = optional(string, "Growe")
    })
    validity_period_hours = optional(number, 8760)
    early_renewal_hours   = optional(number, 120)
    allowed_uses          = optional(list(string), ["key_encipherment", "digital_signature", "server_auth"])
    dns_names             = optional(list(string), ["*.prod-infra.cloud.growe.loc"])
  }))
  default = {}
}

variable "generate_tls_private_key" {
  description = "Is set to true , private key pem will be generated automatically. Not necessary to set input for private key in this case"
  type = object({
    create    = optional(bool, true)
    algorithm = optional(string, "RSA")
    rsa_bits  = optional(number, 4096)
  })
  default = {}
}