variable "master_user" {
  type = string
}

variable "master_password" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "ebs_volume_size" {
  type = number
}

variable "allow_ip_list" {
  type = list(string)
}
