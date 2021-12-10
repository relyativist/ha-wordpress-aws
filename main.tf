resource "aws_key_pair" "local-aws-pair" {
    key_name   = "local-aws-pair"
    public_key = file(var.public-key-path)
}

