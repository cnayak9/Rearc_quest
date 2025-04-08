variable "region" {
  default = "us-east-1"

}
variable "key_name" {
  type    = string
  default = "Ubuntu_Key"

}
## Defined keys in tfvars file
variable "access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}
##################################

