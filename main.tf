resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = "${var.domain_name}_logs"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_resource_policy" "cloudwatch_log_group_policy" {
  policy_name = "${var.domain_name}_logs_policy"
  policy_document = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Effect" = "Allow",
        "Principal" = {
          "Service" = "es.amazonaws.com"
        },
        "Action" = [
          "logs:PutLogEvents",
          "logs:PutLogEventsBatch",
          "logs:CreateLogStream"
        ],
        "Resource" = "arn:aws:logs:*"
      }
    ]
  })
}


resource "aws_elasticsearch_domain" "elasticsearch_domain" {
  domain_name           = var.domain_name
  elasticsearch_version = var.elasticsearch_version

  encrypt_at_rest {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }

  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true

    master_user_options {
      master_user_name     = var.master_user
      master_user_password = var.master_password
    }
  }

  auto_tune_options {
    desired_state       = "ENABLED"
    rollback_on_disable = "NO_ROLLBACK"
  }

  cluster_config {
    instance_count = var.instance_count
    instance_type  = var.instance_type

    zone_awareness_enabled = false
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_volume_size
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.cloudwatch_log_group.arn
    log_type                 = "ES_APPLICATION_LOGS"
  }

  node_to_node_encryption {
    enabled = true
  }
}

resource "aws_elasticsearch_domain_policy" "main" {
  domain_name = aws_elasticsearch_domain.elasticsearch_domain.domain_name

  access_policies = jsonencode(
    {
      "Version" = "2012-10-17",
      "Statement" = [
        {
          "Action"    = "es:*",
          "Principal" = "*",
          "Effect"    = "Allow",
          "Condition" = {
            "IpAddress" = {
              "aws:SourceIp" = var.allow_ip_list
            }
          },
          "Resource" = "${aws_elasticsearch_domain.elasticsearch_domain.arn}/*"
        }
      ]
  })
}
