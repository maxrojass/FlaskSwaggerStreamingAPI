provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_kinesis_stream" "test_stream" {
  name             = "terraform-kinesis-streaming-api-daredata-test"
  shard_count      = 1
  retention_period = 40

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = {
    Environment = "test"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "streaming-api-daredatastreambucket"
  acl    = "private"
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role_-streaming-api-daredata"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  
  ]
}
EOF
}

 resource "aws_iam_policy" "policy" {
       name   = "S3FullAccess"
       path   = "/"
       policy = jsonencode(
            {
               Statement = [
                   {
                       Action   = "s3:*"
                       Effect   = "Allow"
                       Resource = "*"
                       Sid      = "S3FullAccess"
                    },
                ]
               Version   = "2012-10-17"
            }
        )
    }
    
resource "aws_kinesis_firehose_delivery_stream" "test_stream" {
  name        = "terraform-kinesis-firehose-streaming-api-daredata-test-stream"

  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.bucket.arn
    buffer_size = 1
    buffer_interval = 60
  }
}