resource "aws_db_subnet_group" "rds-private-subnet" {
    name = "rds-private-subnet-group"
    subnet_ids = [aws_subnet.base-subnet-private-1.id, aws_subnet.base-subnet-private-2.id]
}

resource "aws_security_group" "base-rds-sg" {
    name   = "base-rds-sg"
    vpc_id = aws_vpc.base-vpc.id
}

#resource "aws_security_group_rule" "mysql_inbound_access" {
resource "aws_security_group_rule" "db-inbound-access" {
    from_port         = 3306
    protocol          = "tcp"
    security_group_id = "${aws_security_group.base-rds-sg.id}"
    to_port           = 3306
    type              = "ingress"
    cidr_blocks       = ["0.0.0.0/0"]
}

#resource "aws_db_instance" "my_test_mysql" {
resource "aws_db_instance" "db-base-mysql" {
    allocated_storage           = 20
    storage_type                = "gp2"
    engine                      = "mysql"
    engine_version              = "5.7"
    instance_class              = "${var.db-instance-type}"
    #name                        = "myrdstestmysql"
    name                        = "baserdsmysql"    
    username                    = "admin"
    password                    = "admin123"
    parameter_group_name        = "default.mysql5.7"
    db_subnet_group_name        = "${aws_db_subnet_group.rds-private-subnet.name}"
    vpc_security_group_ids      = ["${aws_security_group.base-rds-sg.id}"]
    auto_minor_version_upgrade  = true
    #add 2nd ava zone
    availability_zone           = "${aws_subnet.base-subnet-private-1.availability_zone}"
    maintenance_window          = "Sat:04:00-Sat:06:00"
    multi_az                    = true
    skip_final_snapshot         = true
    final_snapshot_identifier = false
}

output "RDS-Endpoint" {
   value = aws_db_instance.db-base-mysql.endpoint
}




