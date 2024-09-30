
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["637423583244"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.example[0].id}",
      "arn:aws:s3:::${aws_s3_bucket.example[0].id}/*",
    ]
  }
}

data "aws_iam_policy_document" "allow_put_and_get_acl" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["637423583244"]
    }

    actions = [
      "s3:PutObject",
      "s3:GetObjectAcl",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.example[1].id}",
      "arn:aws:s3:::${aws_s3_bucket.example[1].id}/*",
    ]

  }
}

data "aws_iam_policy_document" "allow_put_delete_objects" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["637423583244"]
    }

    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.example[2].id}",
      "arn:aws:s3:::${aws_s3_bucket.example[2].id}/*",
    ]

  }
}
