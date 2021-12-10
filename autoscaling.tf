resource "aws_launch_configuration" "as-conf" {
    name      = "web_config"
    image_id  = lookup(var.ami-name, var.aws-region)
    depends_on = [aws_efs_mount_target.efs-mt]
    instance_type = var.instance-type
    key_name = "${aws_key_pair.local-aws-pair.id}"
    security_groups = [aws_security_group.security-allowed.id]
    user_data = data.template_file.init.rendered
}

data "template_file" "init" {
    template = "${file("router-init.sh")}"

    vars = {
        rds_localhost = aws_db_instance.db-base-mysql.endpoint
    }
}

#resource "aws_autoscaling_group" "foobar" {
resource "aws_autoscaling_group" "as-group" {
    name                      = "as-group"
    max_size                  = 4
    min_size                  = 2
    #link elb with autoscaling group
    health_check_grace_period = 1000
    health_check_type         = "ELB"
    load_balancers = ["${aws_elb.web-elb.name}"]
    force_delete              = false
    launch_configuration      = aws_launch_configuration.as-conf.name
    vpc_zone_identifier       = ["${aws_subnet.base-subnet-public-1.id}", "${aws_subnet.base-subnet-public-2.id}"]
    tag {
        key                 = "Name"
        value               = "ec2 instance"
        propagate_at_launch = true
    }
}

