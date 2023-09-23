resource "aws_key_pair" "mtc_auth" {
  # Run ssh-keygen -t rsa -f ~/.ssh/dev_node_key
  key_name   = "dev_node_key"
  public_key = file("~/.ssh/dev_node_key.pub")
}

resource "aws_instance" "dev_node" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.mtc_auth.key_name
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id              = aws_subnet.mtc_public_subnet.id
  user_data              = file("scripts/user-data.sh")

  iam_instance_profile = aws_iam_instance_profile.ec2_s3_access_profile.name

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "dev-node"
  }
}