output "this_security_group_vpc_id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}