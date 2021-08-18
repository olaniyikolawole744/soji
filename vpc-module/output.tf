output "vpc-id-output" {
  value = aws_vpc.app_vpc.id
}

output "subnet-id-project4-output" {
  value = aws_subnet.app_vpc_subnet[1].id
}

output "subnet-id-appproject-output" {
  value = aws_subnet.app_vpc_subnet[2].id
}




