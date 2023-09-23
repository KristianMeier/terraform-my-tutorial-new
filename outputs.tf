output "aws-instance_dev-node_public_ip" {
  value = aws_instance.dev_node.public_ip
}

output "aws-s3-bucket_my-bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "aws-eip_dev-node-eip_public-ip" {
  value = aws_eip.dev_node_eip.public_ip
}