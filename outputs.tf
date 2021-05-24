output "email_sending_group" {
  value       = aws_iam_group.email_sending
  description = "The IAM group whose members are allowed to send email via SES."
}

output "email_sending_policy" {
  value       = aws_iam_policy.email_sending
  description = "The IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account."
}

output "suppression_list_management_group" {
  value       = aws_iam_group.suppression_list_management
  description = "The IAM group whose members are allowed to manage the SES email suppression list."
}

output "suppression_list_management_policy" {
  value       = aws_iam_policy.suppression_list_management
  description = "The IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account."
}
