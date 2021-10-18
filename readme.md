https://github.com/aws-samples/ecs-refarch-cloudformation

Command create vpc

aws cloudformation create-stack --stack-name ecs-infrastructure --template-body file://core-infrastructure-setup.yml --capabilities CAPABILITY_IAM

command create ecs fargate

aws cloudformation create-stack --stack-name ecs-fargate --template-body file://ecs-fargate-via-cloudformation.yml --capabilities CAPABILITY_IAM

aws cloudformation create-stack --stack-name ecs-ec2 --template-body file://ecs-ec2-via-cloudformation.yml --capabilities CAPABILITY_IAM

get latest ima

aws ssm get-parameters-by-path --path /aws/service/ami-amazon-linux-latest


#!/bin/bash
echo ECS_CLUSTER=ecs-course-cluster >> /etc/ecs/ecs.config;echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;

#!/bin/bash -xe
echo ECS_CLUSTER=ecs-course-ec2 >> /etc/ecs/ecs.config
yum install -y aws-cfn-bootstrap
/opt/aws/bin/cfn-signal -e $? --stack ecs-ec2 --resource ECSAutoScaling --region us-east-1

aws cloudformation create-stack --stack-name enhanced-architecture --template-body file://setup-infrastructure.yml --capabilities CAPABILITY_IAM

test autoscaling command

ab -n 500000 -c 500 url
