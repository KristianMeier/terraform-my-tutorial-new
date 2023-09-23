#!/bin/bash
# Install git and clone repo
sudo yum update -y
sudo yum install git -y
cd /home/ec2-user
sudo mkdir react-app && cd react-app
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa /home/ec2-user/.ssh/id_rsa
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa.pub /home/ec2-user/.ssh/id_rsa.pub
sudo chmod 600 /home/ec2-user/.ssh/id_rsa
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:KristianMeier/cvr-for-aws-september-static-private.git .

# Install Docker
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Run Docker Compose
sudo docker-compose up