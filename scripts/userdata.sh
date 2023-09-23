#!/bin/bash
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
sudo yum update -y
sudo yum install git -y
cd /var/www/html
sudo git clone https://github.com/KristianMeier/cvr-for-aws-september-static-public.git .

sudo git clone https://github.com/KristianMeier/cvr-for-aws-september.git .


# Install Docker - the stuff that working manually
#sudo amazon-linux-extras install docker
#sudo service docker start
#sudo systemctl enable docker
#sudo usermod -a -G docker ec2-user

# Install Docker - the stuff that GPT suggested for a script
# sudo yum install docker -y
# sudo service docker start
# sudo usermod -a -G docker ec2-user
# sudo chkconfig docker on

# Install docker compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose



### SSH into private git repo
# Problem: Det dur ikke i script, da man skal skrive "yes" på et tidspunkt
# aws s3 cp s3://krille-unikt-navn-hihi/id_rsa /home/ec2-user/.ssh/id_rsa
# aws s3 cp s3://krille-unikt-navn-hihi/id_rsa.pub /home/ec2-user/.ssh/id_rsa.pub
# sudo chmod 600 /home/ec2-user/.ssh/id_rsa
# git clone git@github.com:KristianMeier/cvr-for-aws-september-static-private.git .

### Build React app on server
# Problem: Node vil ikke installere (det virkede på et tidspunkt)
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# source ~/.bashrc
# nvm install 16.0.0
# cd /home/ec2-user
# mkdir react-app && cd react-app
# git clone https://github.com/KristianMeier/cvr-for-aws-september.git .
# npm i && npm run build
# sudo cp -r build/* /var/www/html/