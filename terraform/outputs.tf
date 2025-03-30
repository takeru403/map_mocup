output "instance_ip" {
  value = aws_eip.flask_eip.public_ip
}

output "domain_name" {
  value = aws_route53_record.flask.fqdn
}
