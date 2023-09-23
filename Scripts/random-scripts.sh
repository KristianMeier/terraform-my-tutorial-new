# new_user_data
terraform taint aws_instance.dev_node && terraform apply -auto-approve

# ssh_into_aws_linux
DEV_IP=$(terraform output dev_ip | tr -d '"') \
ssh -i ~/.ssh/mtckey ec2-user@$DEV_IP

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