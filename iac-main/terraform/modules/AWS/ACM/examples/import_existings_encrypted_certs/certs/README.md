# How to decrypt keys

aws kms encrypt --key-id ${kms_id} --plaintext fileb://cert_to_encrypt --encryption-context service=acm --output text --query CiphertextBlob --region ${aws_region}
aws kms encrypt --key-id ${kms_id} --plaintext fileb://cert_key_to_encrypt --encryption-context service=acm --output text --query CiphertextBlob --region ${aws_region}