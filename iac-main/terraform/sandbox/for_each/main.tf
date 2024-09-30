resource "aws_s3_bucket" "example" {
  for_each = var.full_bucket_config
  
  bucket = each.value.bucket_name
  

  tags = {
    Name = each.value.tag_name
    }
}



resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  for_each = var.full_bucket_config
  bucket = aws_s3_bucket.example[each.key].id
  policy = data.aws_iam_policy_document.allow_access_from_another_account[each.key].json
}

