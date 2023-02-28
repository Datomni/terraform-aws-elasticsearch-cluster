output "elasticsearch_endpoint" {
  value = aws_elasticsearch_domain.elasticsearch_domain.endpoint
}

output "kibana_endpoint" {
  value = aws_elasticsearch_domain.elasticsearch_domain.kibana_endpoint
}
