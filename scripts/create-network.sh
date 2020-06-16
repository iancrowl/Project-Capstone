aws cloudformation create-stack \
--stack-name project-capstone-network \
--template-body file:///home/ubuntu/Project-Capstone/CloudFormation/network.yml \
--parameters file:///home/ubuntu/Project-Capstone/CloudFormation/network-params.json \
--region us-east-2 \
#--capabilities CAPABILITY_NAMED_IAM