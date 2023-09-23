# new_user_data
terraform taint aws_instance.dev_node && terraform apply -auto-approve

# ssh_into_aws_linux
DEV_IP=$(terraform output dev_ip | tr -d '"') \
ssh -i ~/.ssh/mtckey ec2-user@$DEV_IP

# user_data_log
sudo cat /var/log/cloud-init-output.log
