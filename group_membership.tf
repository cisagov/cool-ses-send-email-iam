# Assign membership to the group that allows for sending emails via
# SES.
resource "aws_iam_user_group_membership" "email_sending" {
  for_each = toset([for x in var.group_membership : x.name if x.can_send_email])
  provider = aws.users

  groups = [
    aws_iam_group.email_sending.name,
  ]
  user = each.value
}

# Assign membership to the group that allows for managing the SES
# email suppression list.
resource "aws_iam_user_group_membership" "suppression_list_management" {
  for_each = toset([for x in var.group_membership : x.name if x.can_manage_suppression_list])
  provider = aws.users

  groups = [
    aws_iam_group.suppression_list_management.name,
  ]
  user = each.value
}
