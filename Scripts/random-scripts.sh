# new_user_data
terraform taint aws_instance.dev_node && terraform apply -auto-approve

# ssh_into_aws_linux
DEV_IP=$(terraform output dev_ip | tr -d '"') \
ssh -i ~/.ssh/mtckey ec2-user@$DEV_IP

[ ! -f /Users/kristianmeier/.ssh/known_hosts ] \|| rm /Users/kristianmeier/.ssh/known_hosts; ssh -i ~/.ssh/dev_node_key ec2-user@13.50.161.253


# user_data_log
sudo cat /var/log/cloud-init-output.log

sed -i '' '45d' /Users/kristianmeier/.ssh/known_hosts
rm /Users/kristianmeier/.ssh/known_hosts
nano /Users/kristianmeier/.ssh/known_hosts

lsof -i
kill -9 <PID>

# Docker
docker rmi $(docker images -q) -f
docker system prune
docker ps -a
ENV=dev docker-compose up
docker-compose down --rmi all -v

# SSH ind i private, der ikke virker (kun manuelt)
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa /home/ec2-user/.ssh/id_rsa
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa.pub /home/ec2-user/.ssh/id_rsa.pub
sudo chmod 600 /home/ec2-user/.ssh/id_rsa
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:KristianMeier/cvr-for-aws-september-static-private.git .
