variable "region" {
  default = "us-east-1"

}
/*variable "access_key" {

}
variable "secret_key" {

}*/
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
/*variable "pub-sub" {
  default = {
    "rearc-pub-sub_1" = 0
    "rearc-pub-sub_2" = 1
  }

}
variable "priv-sub" {
  default = {
    "rearc-priv-sub_1" = 0
    "rearc-priv-sub_2" = 1
  }

}*/
##################################
/*variable "sg_ports" {
  type        = list(number)
  description = "list of inbound port"

}*/

