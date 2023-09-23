output "aws_instance.dev_node.public_ip" {
  value = aws_instance.dev_node.public_ip
}

output "aws_s3_bucket.my_bucket.arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "aws_eip.dev_node_eip.public_ip" {
  value       = aws_eip.dev_node_eip.public_ip
}