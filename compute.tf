resource "aws_key_pair" "mtc_auth" {
  key_name   = "mtckey"
  public_key = file("~/.ssh/mtckey.pub")
}

resource "aws_instance" "dev_node" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.mtc_auth.key_name
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id              = aws_subnet.mtc_public_subnet.id
  user_data              = file("scripts/userdata.sh")

  iam_instance_profile = aws_iam_instance_profile.ec2_s3_access_profile.name

  root_block_device {
    volume_size = var.volume_size // 16 max for free tier
  }

  tags = {
    Name = "dev-node"
  }
}

# Elastic IP for the EC2 instance
resource "aws_eip" "dev_node_eip" {
  domain = "vpc"

  tags = {
    Name = "dev-node-eip"
  }
}

# Associate the Elastic IP with the EC2 instance
# Ellers vil den bare bli liggende og ikke bli brukt
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.dev_node.id
  allocation_id = aws_eip.dev_node_eip.id
}
