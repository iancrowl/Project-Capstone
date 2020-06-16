aws cloudformation create-stack \
--stack-name project-capstone-eks-cluster \
--template-body file:///home/ubuntu/Project-Capstone/CloudFormation/eks-cluster.yml \
--parameters file:///home/ubuntu/Project-Capstone/CloudFormation/eks-cluster-params.json \
--region us-east-2 \
#--capabilities CAPABILITY_NAMED_IAM