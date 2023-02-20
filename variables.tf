variable "master_user" {
  type = string
  description = "Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database"
}

variable "master_password" {
  type = string
  description = "Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database"
}

variable "instance_type" {
  type = string
  description = "Instance type of data nodes in the cluster"
}

variable "instance_count" {
  type = number
  description = "Number of instances in the cluster"
}

variable "ebs_volume_size" {
  type = number
  description = "Size of EBS volumes attached to data nodes (in GiB)"
}

variable "allow_ip_list" {
  type = list(string)
  description = "List of IP addresses that can access the ElasticSearch cluster"
}
