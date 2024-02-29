resource "aws_lambda_function" "ec2_instance_stop_lambda" {
  filename      = "lambda_function_stop.zip"
  function_name = var.ec2_instance_stop
  role          = var.lambda_role
  handler       = "lambda_function_stop.lambda_handler"
  runtime       = var.runtime_version
}

resource "aws_cloudwatch_event_target" "stop_target" {
  rule      = aws_cloudwatch_event_rule.lambda_trigger_stop_rule.name
  target_id = var.stop_target_name
  arn       = aws_lambda_function.ec2_instance_stop_lambda.arn
}

resource "aws_cloudwatch_event_rule" "lambda_trigger_stop_rule" {
  name                = var.stop_event_rule_name
  schedule_expression = var.stop_event_schedule
}
