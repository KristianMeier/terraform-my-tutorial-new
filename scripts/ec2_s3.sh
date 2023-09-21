touch /home/ec2-user/myfile.txt
aws s3 cp /home/ec2-user/myfile.txt s3://krille-unikt-navn-hihi/myfile_from_s3_to_ec2.txt

aws s3 cp s3://krille-unikt-navn-hihi/myfile_from_s3_to_ec2.txt /home/ec2-user/myfile_from_s3.txt

aws s3 cp s3://krille-unikt-navn-hihi/id_rsa ~/.ssh/id_rsa
aws s3 cp s3://krille-unikt-navn-hihi/id_rsa.pub ~/.ssh/id_rsa.pub

aws s3 cp ~/.ssh/id_rsa s3://krille-unikt-navn-hihi/id_rsa 
aws s3 cp  ~/.ssh/id_rsa.pub s3://krille-unikt-navn-hihi/id_rsa.pub