resource "aws_s3_bucket" "app_public_files" {
  bucket = "${local.prefix}-files"
  acl    = "public-read"

  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls" {
  bucket = aws_s3_bucket.app_public_files.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_access" {
  bucket = aws_s3_bucket.app_public_files.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_ownership_controls,
    aws_s3_bucket_public_access_block.s3_access,
  ]

  bucket = aws_s3_bucket.app_public_files.id
  acl    = "public-read"
}