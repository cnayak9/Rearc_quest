output "vpc_id" {
  value = [aws_vpc.rearc.id, aws_vpc.rearc.cidr_block]

}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}