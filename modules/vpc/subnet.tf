resource "aws_subnet" "main"{
    vpc_id = var.vpc_id
    cidr_block = var.sub_cidr[count.index]
    count = var.count1
       tags = { 
        "Name" = "subnet11"
    }
}
output "subnet-id" {
    value = "aws_subnet.main.id"
}