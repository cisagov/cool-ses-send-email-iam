output "email_sending_group" {
  description = "The IAM group whose members are allowed to send email via SES."
  value       = aws_iam_group.email_sending
}

output "email_sending_policy" {
  description = "The IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account."
  value       = aws_iam_policy.email_sending
}

output "suppression_list_management_group" {
  description = "The IAM group whose members are allowed to manage the SES email suppression list."
  value       = aws_iam_group.suppression_list_management
}

output "suppression_list_management_policy" {
  description = "The IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account."
  value       = aws_iam_policy.suppression_list_management
}
