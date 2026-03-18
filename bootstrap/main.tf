resource "aws_s3_bucket" "bucket" {
  bucket = "aws-multi-region-ha-dr"
  tags = {
    Name        = "AWS multi region bucket"
    Description = "S3 bucket to state the state file for terraform project"
    Region      = "US"
    Env         = "Dev"
  }

}


resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "ddb_table" {
  name         = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}
