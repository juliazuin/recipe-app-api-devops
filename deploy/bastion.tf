data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-2.0.*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  user_data     = file("./templates/bastion/user-data.sh")

  tags = merge(
    local.common_tags,
    tomap({ "Name" : "${local.prefix}-bastion" })
  )
}
