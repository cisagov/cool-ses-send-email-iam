# The group whose members are allowed to send email via SES.
resource "aws_iam_group" "email_sending" {
  provider = aws.users

  name = var.email_sending_group_name
}

# Attach the policy that allows assumption of the email sending role.
resource "aws_iam_group_policy_attachment" "email_sending" {
  provider = aws.users

  group      = aws_iam_group.email_sending.name
  policy_arn = aws_iam_policy.email_sending.arn
}

# The group whose members are allowed to manage the SES email
# suppression list.
resource "aws_iam_group" "suppression_list_management" {
  provider = aws.users

  name = var.suppression_list_management_group_name
}

# Attach the policy that allows assumption of the suppression list
# management role.
resource "aws_iam_group_policy_attachment" "suppression_list_management" {
  provider = aws.users

  group      = aws_iam_group.suppression_list_management.name
  policy_arn = aws_iam_policy.suppression_list_management.arn
}
