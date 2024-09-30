module "acm_private_certs" {
  source = "../../"

  # Import existing issued or self-signed cert
  certs_to_import = {
    growe_tech = {
      plaintext = {
        private_key      = file("./certs/key.pem")
        certificate_body = file("./certs/cert.pem")
      }
    }
  }
}