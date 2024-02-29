import boto3
def lambda_handler(event, context):
    '''
    In this Lambda handler function we create ec2 instance client using boto3 
    and then fetch all the instances based ob AutoStartStop Tag.
    '''
    ec2_client = boto3.client('ec2')
    response = ec2_client.describe_instances(Filters=[
        {
            'Name': 'tag:AutoStartStop',
            'Values': ['Yes']
        }
    ])
    instance_ids = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_ids.append(instance['InstanceId'])
    if instance_ids:
        ec2_client.start_instances(InstanceIds=instance_ids)
        print(f"Started instances: {', '.join(instance_ids)}")
    else:
        print("No instances found with tag AutoStartStop:Yes")

    return {
        'statusCode': 200,
        'body': 'EC2 instances started successfully' if instance_ids else 'No EC2 instances to start'
    }
