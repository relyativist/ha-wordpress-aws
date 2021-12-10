resource "aws_efs_file_system" "base-efs" {
    creation_token = "base-efs"
    performance_mode = "generalPurpose"
    throughput_mode = "bursting"
    encrypted = "true"
    tags = {
        Name = "base-efs"
    }
}

resource "aws_efs_mount_target" "efs-mt" {
    file_system_id  = "${aws_efs_file_system.base-efs.id}"
    subnet_id = aws_subnet.base-subnet-public-1.id
    security_groups = ["${aws_security_group.security-allowed.id}"]
}

