resource "aws_s3_bucket" "example" {
  #bucket = "ketbuck05"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}