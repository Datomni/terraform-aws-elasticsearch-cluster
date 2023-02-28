variable "domain_name" {
  type        = string
  description = "Name of the domain"
}

variable "master_user" {
  type        = string
  description = "Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database"
}

variable "master_password" {
  type        = string
  description = "Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database"
}

variable "elasticsearch_version" {
  type        = string
  default     = "7.10"
  description = "Version of Elasticsearch to deploy."
}

variable "instance_type" {
  type        = string
  default     = "t3.small.elasticsearch"
  description = "Instance type of data nodes in the cluster"
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances in the cluster"
}

variable "ebs_volume_size" {
  type        = number
  default     = 50
  description = "Size of EBS volumes attached to data nodes (in GiB)"
}

variable "allow_ip_list" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of IP addresses that can access the ElasticSearch cluster"
}

variable "log_retention_days" {
  type        = number
  default     = 7
  description = "Cloudwatch log retention period"
}
