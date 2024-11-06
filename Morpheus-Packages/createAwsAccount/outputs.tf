output "new_account_id" {
  description = "ID of the new account created"
  value       = aws_organizations_account.new_account.id
}

output "new_account_arn" {
  description = "ARN of the new account created"
  value       = aws_organizations_account.new_account.arn
}

output "new_account_status" {
  description = "Status of the new account created"
  value       = aws_organizations_account.new_account.status
}

output "new_account_name" {
  description = "Name of the new account created"
  value       = aws_organizations_account.new_account.name
}

output "new_account_email" {
  description = "Email associated with the new account created"
  value       = aws_organizations_account.new_account.email
}