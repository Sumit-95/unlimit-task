# IAM Role for Lambda function
resource "aws_iam_role" "lambda_role" {
  name               = "lambda_role"
  assume_role_policy = data.template_file.ec2_start_stop_policy_assume_role_policy.rendered
  path               = "/service-role/"
  tags               = var.tags
}

# IAM Policy for Lambda function
resource "aws_iam_policy" "ec2_start_stop_policy" {
  name        = "policy-for-ec2-start-stop"
  description = "Policy for Lambda function"
  policy      = data.template_file.ec2_start_stop_policy.rendered
}

# Attach IAM policy to Lambda role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  policy_arn = aws_iam_policy.ec2_start_stop_policy.arn
  role       = aws_iam_role.lambda_role.name
}
