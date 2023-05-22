# CREATES ROUTE53 RECORD
resource "aws_route53_record" "dns-record" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_ID
  name    = "rabbitmq-dev.${data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_NAME}"
  type    = "A"
  ttl     = 10
  records =  [aws_spot_instance_request.rabbitmq.private_ip]
}