data "template_file" "ec2_start_stop_policy_assume_role_policy" {
  template = file("${path.module}/policy/ec2_start_stop_policy_assume_role_policy.json.tpl")
}

data "template_file" "ec2_start_stop_policy" {
  template = file("${path.module}/policy/ec2_start_stop_policy.json.tpl")
}
