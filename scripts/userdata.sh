#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
sudo yum update -y
sudo yum install git -y
cd /var/www/html
# sudo git clone https://github.com/KristianMeier/cvr-for-aws-september-static.git .
# sudo systemctl restart httpd
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa ~/.ssh/id_rsa
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa.pub ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
git clone git@github.com:KristianMeier/cvr-for-aws-september-static.git
