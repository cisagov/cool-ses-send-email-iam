# The policy document that allows assumption of the email sending role
# in the DNS account.
data "aws_iam_policy_document" "email_sending" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      data.terraform_remote_state.dns.outputs.sessendemail_role.arn,
    ]
  }
}

# The policy that allows assumption of the email sending role in the
# DNS account.
resource "aws_iam_policy" "email_sending" {
  provider = aws.users

  description = var.email_sending_policy_description
  name        = var.email_sending_policy_name
  policy      = data.aws_iam_policy_document.email_sending.json
}

# The policy document that allows assumption of the email suppression
# list management role in the DNS account.
data "aws_iam_policy_document" "suppression_list_management" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      data.terraform_remote_state.dns.outputs.sesmanagesuppressionlist_role.arn,
    ]
  }
}

# The policy that allows assumption of the email suppression list
# management role in the DNS account.
resource "aws_iam_policy" "suppression_list_management" {
  provider = aws.users

  description = var.suppression_list_management_policy_description
  name        = var.suppression_list_management_policy_name
  policy      = data.aws_iam_policy_document.suppression_list_management.json
}
