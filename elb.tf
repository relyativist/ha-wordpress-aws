resource "aws_elb" "web-elb" {
    name = "web-elb"
    security_groups = ["${aws_security_group.security-allowed.id}"]
    subnets = ["${aws_subnet.base-subnet-public-1.id}", "${aws_subnet.base-subnet-public-2.id}"]
    cross_zone_load_balancing   = true

    ## remove instance after 400 s of deletion
    connection_draining =  true
    connection_draining_timeout = 1000

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        interval = 30
        target = "HTTP:80/"
    }

    listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = "80"
        instance_protocol = "http"
    }

    tags = {
        Name = "my-elb"
    }
}


