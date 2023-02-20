# aws-elasticsearch-tf-module
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version    |
|------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1       |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | \>= 3.45.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | \>= 3.1.0  |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.cloudwatch_log_group_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_elasticsearch_domain.elasticsearch_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain) | resource |
| [aws_elasticsearch_domain_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_ip_list"></a> [allow\_ip\_list](#input\_allow\_ip\_list) | List of IP addresses that can access the ElasticSearch cluster | `list(string)` | n/a | yes |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Size of EBS volumes attached to data nodes (in GiB) | `number` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances in the cluster | `number` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type of data nodes in the cluster | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database | `string` | n/a | yes |
| <a name="input_master_user"></a> [master\_user](#input\_master\_user) | Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->