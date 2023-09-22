# install

- terraform init
- terramform apply

# run

- terraform state show aws_instance.dev_node
- copy public_ip
- go to http://public_ip

# Togo

- Make git private and ssh. It's public now.
- Brug Terraform CLoud

# Structure

## Organize by Functionality/Component:

- networking.tf: Contains VPC, subnets, NAT gateways, etc.
- compute.tf: Contains EC2 instances, autoscaling groups, etc.
- storage.tf: Contains S3 buckets, EBS volumes, etc.

## Docker Notes

- Parent image includes the OS and sometimes the runtime environment
- "COPY . ." tager filerne fra filerne i mappen med Docker og kopiere dem ned i root-directory på fx. alpine imaged. Det er lidt sjusket, da alle linux root mapperne også likekr der. Derfor er skal der laves "WORKDIR /app". "COPY . ." er så relativt til workdir. Der skal nok laves en mappen først.
- RUN er når images bliver byget
- CMD er ved runtime, altså når man vilkører containeren.
