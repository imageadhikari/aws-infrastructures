output "vpc_id" {
      value = aws_vpc.vpc.id
}

output "public_subnet_id" {
      value = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

output "private_subnet_id" {
      value = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
}