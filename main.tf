provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "tierbucket-cicd-test" {
  bucket = "tierbucket-cicd-test"
}

resource "aws_s3_bucket_object" "tierObject" {
    bucket = aws_s3_bucket.tierbucket-cicd-test.id
    key    = "tierObject"
    source = "${path.module}/tierObject.txt"

    depends_on = [local_file.tierObjectFile]
}

resource "local_file" "tierObjectFile" {
    content     = "I am a test object file"
    filename = "${path.module}/tierObject.txt"
}