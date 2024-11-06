variable "access_key" {
  type        = string
  description = "AWS Access Key of a user with permissions to create an AWS account"
}
variable "secret_key" {
  type        = string
  description = "AWS Secret Key assoicated to the AWS Access Key"
}
variable "region" {
  type        = string
  description = "AWS Region must be set as required by the AWS provider, even if the resources created at global"
  default     = "us-east-1"
}
variable "account_name" {
  type        = string
  description = "Account name assigned to the new AWS account."
}
variable "account_email" {
  type        = string
  description = "Email associated with the AWS account.  Must be unique, emails cannot be reused for additional AWS accounts."
}
variable "close_on_deletion" {
  type        = bool
  description = "true/false - When destroying the Terraform deployment, should it close the account as well?"
}