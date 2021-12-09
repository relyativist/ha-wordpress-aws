variable "aws-access-key-id" {
    type = string
    description = "Please provide aws access id"
}

variable "aws-secret-access-key" {
    type = string
    description = "Please provide aws access secret"
}

variable "instance-type" {
    type = string
    default = "t2.micro"
}

variable "ami-name" {
    type = map(string)
    default = {
        eu-central-1 = "ami-00d5e377dd7fad751" 
    }
}

variable "public-key-path" {
    type = string
    default = "my-key.pub"
}

variable "private-key-path" {
    type = string
    default = "my-key"    
}

variable "ec2-user" {
    type = string
    default = "ubuntu"
}

variable "aws-region" {
    default = "eu-central-1"
}

variable "db-instance-type" {
    default = "db.t2.micro"
}

#

