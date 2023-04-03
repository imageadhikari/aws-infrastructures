output "ec2_id" {
      value = aws_instance.ec2.id
}

output "security_group_id" {
      value = aws_security_group.ec2-sg.id 
}
