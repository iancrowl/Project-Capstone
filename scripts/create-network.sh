aws cloudformation create-stack \
--stack-name project-capstone-network \
--template-body file://./Cloudformation/network.yml \
--parameters file://./Cloudformation/network-params.yml \
--region us-east-2 \
#--capabilities CAPABILITY_NAMED_IAM