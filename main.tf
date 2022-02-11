resource "aws_autoscaling_group" "amir_test1" {
  availability_zones        = ["eu-west-1"]
  name                      = "terraform-test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
}

resource "aws_autoscaling_schedule" "amir_test1" {
  scheduled_action_name  = "foobar"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  start_time             = "2022-12-11T10:00:00Z"
  end_time               = "2022-12-12T12:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.amir_test1.name
}
