variable "gcp_auth" {
  type        = string
  description = "GCP authentication file or contents"
  sensitive   = true
}

## Example variable content input if not specifying a file path.  This can be obtained by generating a key for your service account in GCP:
# gcp_auth = <<-EOT
# {
#     "type": "service_account",
#     "project_id": "serviceaccounts-111111",
#     "private_key_id": "dadf2ba5fdecaaaaaafa03bd06baaaaa5ca738a9",
#     "private_key": "-----BEGIN PRIVATE KEY-----\nprivatekey\n-----END PRIVATE KEY-----\n",
#     "client_email": "morpheusterraform@serviceaccounts-111111.iam.gserviceaccount.com",
#     "client_id": "108004666666662150438",
#     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
#     "token_uri": "https://oauth2.googleapis.com/token",
#     "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
#     "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/morpheusterraform%40serviceaccounts-111111.iam.gserviceaccount.com"
# }
# EOT

variable "project_id" {
  type        = string
  description = "ID of the project to create resources in"
}

variable "network_name" {
  type        = string
  description = "Name of the network to be created, which will contain subnets"
}