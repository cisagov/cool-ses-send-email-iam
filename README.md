# cool-ses-send-email-iam #

[![GitHub Build Status](https://github.com/cisagov/cool-ses-send-email-iam/workflows/build/badge.svg)](https://github.com/cisagov/cool-ses-send-email-iam/actions)

This is a Terraform deployment for creating IAM resources for those
users allowed to send email or manage the email suppression list in
the COOL.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
  - User accounts for all users must have been created previously.  We
  recommend using the
  [`cisagov/cool-users-non-admin`](https://github.com/cisagov/cool-users-non-admin)
  repository to create users.
  - Terraform in
  [`cisagov/cool-dns-cyber.dhs.gov`](https://github.com/cisagov/cool-dns-cyber.dhs.gov)
  must have been applied.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.users | ~> 3.38 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_group.email_sending](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.suppression_list_management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.email_sending](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.suppression_list_management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.email_sending](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.suppression_list_management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_group_membership.email_sending](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_group_membership.suppression_list_management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_caller_identity.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.email_sending](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.suppression_list_management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region in which resources are to be created (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| email\_sending\_group\_name | The name of the IAM group whose members are allowed to send email via SES. | `string` | `"SES_cyber.dhs.gov_emailers"` | no |
| email\_sending\_policy\_description | The description to associate with the IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account. | `string` | `"Allows the email sending group to assume the email sending role in the DNS account."` | no |
| email\_sending\_policy\_name | The name of the IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account. | `string` | `"DNS-AssumeSesSendEmail-cyber.dhs.gov"` | no |
| group\_membership | A list of the usernames of users that exist in the Users account comprising the members of the email sending group (e.g. [{name = "lemmy.kilmister", can\_send\_email = true, can\_manage\_suppression\_list = true}, {name = "phil.taylor", can\_send\_email = false, can\_manage\_suppression\_list = true}, {name = "eddie.clarke", can\_send\_email = true, can\_manage\_suppression\_list = false}]). | `list(object({ name = string, can_send_email = bool, can_manage_suppression_list = bool }))` | n/a | yes |
| suppression\_list\_management\_group\_name | The name of the IAM group whose members are allowed to manage the SES email suppression list. | `string` | `"SES_cyber.dhs.gov_suppression_list_managers"` | no |
| suppression\_list\_management\_policy\_description | The description to associate with the IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account. | `string` | `"Allows the suppression list management group to assume the suppression list management role in the DNS account."` | no |
| suppression\_list\_management\_policy\_name | The name of the IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account. | `string` | `"DNS-AssumeSesManageSuppressionList-cyber.dhs.gov"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| email\_sending\_group | The IAM group whose members are allowed to send email via SES. |
| email\_sending\_policy | The IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account. |
| suppression\_list\_management\_group | The IAM group whose members are allowed to manage the SES email suppression list. |
| suppression\_list\_management\_policy | The IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is just the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
