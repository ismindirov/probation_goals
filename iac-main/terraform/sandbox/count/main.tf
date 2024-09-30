resource "aws_s3_bucket" "example" {
  count  = 3
  bucket = "my-tf-test-bucket-ismindirov-${count.index}"

  tags = {
    Name        = "my-tf-test-bucket-ismindirov-${count.index}"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.example[0].id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

resource "aws_s3_bucket_policy" "allow_put_and_get_acl" {
  bucket = aws_s3_bucket.example[1].id
  policy = data.aws_iam_policy_document.allow_put_and_get_acl.json
}

resource "aws_s3_bucket_policy" "allow_put_delete_objects" {
  bucket = aws_s3_bucket.example[2].id
  policy = data.aws_iam_policy_document.allow_put_delete_objects.json
}
