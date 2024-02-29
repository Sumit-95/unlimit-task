# Lambda function to perform instance start
resource "aws_lambda_function" "ec2_instance_start_lambda" {
  filename      = "lambda_function_start.zip"
  function_name = var.ec2_instance_start
  role          = var.lambda_role
  handler       = "lambda_function_start.lambda_handler"
  runtime       = var.runtime_version
}

resource "aws_cloudwatch_event_target" "start_target" {
  rule      = aws_cloudwatch_event_rule.lambda_trigger_start_rule.name
  target_id = var.start_target_name
  arn       = aws_lambda_function.ec2_instance_start_lambda.arn
}

resource "aws_cloudwatch_event_rule" "lambda_trigger_start_rule" {
  name                = var.start_event_rule_name
  schedule_expression = var.start_event_schedule
}

