# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "group_membership" {
  description = "A list of the usernames of users that exist in the Users account comprising the members of the email sending group (e.g. [{name = \"lemmy.kilmister\", can_send_email = true, can_manage_suppression_list = true}, {name = \"phil.taylor\", can_send_email = false, can_manage_suppression_list = true}, {name = \"eddie.clarke\", can_send_email = true, can_manage_suppression_list = false}])."
  nullable    = false
  type        = list(object({ name = string, can_send_email = bool, can_manage_suppression_list = bool }))
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region in which resources are to be created (e.g. us-east-1)."
  nullable    = false
  type        = string
}

variable "email_sending_group_name" {
  default     = "SES_cyber.dhs.gov_emailers"
  description = "The name of the IAM group whose members are allowed to send email via SES."
  nullable    = false
  type        = string
}

variable "email_sending_policy_description" {
  default     = "Allows the email sending group to assume the email sending role in the DNS account."
  description = "The description to associate with the IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account."
  nullable    = false
  type        = string
}

variable "email_sending_policy_name" {
  default     = "DNS-AssumeSesSendEmail-cyber.dhs.gov"
  description = "The name of the IAM policy in the Users account that allows the email sending group to assume the email sending role in the DNS account."
  nullable    = false
  type        = string
}

variable "suppression_list_management_group_name" {
  default     = "SES_cyber.dhs.gov_suppression_list_managers"
  description = "The name of the IAM group whose members are allowed to manage the SES email suppression list."
  nullable    = false
  type        = string
}

variable "suppression_list_management_policy_description" {
  default     = "Allows the suppression list management group to assume the suppression list management role in the DNS account."
  description = "The description to associate with the IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account."
  nullable    = false
  type        = string
}

variable "suppression_list_management_policy_name" {
  default     = "DNS-AssumeSesManageSuppressionList-cyber.dhs.gov"
  description = "The name of the IAM policy in the Users account that allows the suppression list management group to assume the suppression list management role in the DNS account."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
