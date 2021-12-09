resource "aws_vpc" "base-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"
    tags = {
        Name = "base-vpc"
    }
}

resource "aws_subnet" "base-subnet-public-1" {
    vpc_id = aws_vpc.base-vpc.id
    cidr_block ="10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-central-1a"
    tags = {
        Name = "base-subnet-public-1"
    }

}

resource "aws_subnet" "base-subnet-public-2" {
    vpc_id = aws_vpc.base-vpc.id
    cidr_block ="10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-central-1b"
    tags = {
        Name = "base-subnet-public-2"
    }

}

resource "aws_subnet" "base-subnet-private-1" {
    vpc_id = aws_vpc.base-vpc.id
    cidr_block ="10.0.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone =  "eu-central-1c"
    tags = {
        Name = "base-subnet-private-1"
    }
}

resource "aws_subnet" "base-subnet-private-2" {
    vpc_id = aws_vpc.base-vpc.id
    cidr_block ="10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone =  "eu-central-1a"
    tags = {
        Name = "base-subnet-private-2"
    }
}

