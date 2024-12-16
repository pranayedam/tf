resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "avtusea1"
        CostCenter = "billi"
    }
}
output "vpc-id" {
    value = "${aws_vpc.main.id}"
}


