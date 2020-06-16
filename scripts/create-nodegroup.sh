aws cloudformation create-stack \
--stack-name project-capstone-nodegroup \
--template-body file:///home/ubuntu/Project-Capstone/CloudFormation/eks-nodegroup.sh \
--parameters file:///home/ubuntu/Project-Capstone/CloudFormation/eks-nodegroup-params.json \
--region us-east-2 \
--capabilities CAPABILITY_NAMED_IAM