# unlimit-task
This task is about to create a solution which can start and stop ec2 instances on a particular interval of time.

# Assumtion
We assume that we have ec2 instances which have the tag key: AutoStartStop and Tag Value: Yes.

Working of this Solution, there are two Lambda functions which get exceuted at their schduling time. These Lambda function also sends logs to cloudwatch log group to monitor the execution.

# Here is the flow of the solution
CloudWatch Event Rule (Triggers Lambda)
          |
          V
Lambda Function (Start & Stop Functions)
          |
          V
EC2 Instances (Mumbai Region)

!()unlimit-task/image/aws-unlimit.png