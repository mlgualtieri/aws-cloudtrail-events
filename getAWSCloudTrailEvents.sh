#!/bin/bash
#
# This script extracts all the AWS CloudTrail EventSource / EventName pairs from the AWS SDK
#
# Some CloudTrail events are missing from the SDK, for example:
#   eventSource: signin.amazonaws.com
#   https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-event-reference-aws-console-sign-in-events.html
#
# Example to extract the CloudTrail operations
# jq '.shapes[] | select(.type == "service") | .operations[].target' aws-sdk-js-v3/codegen/sdk-codegen/aws-models/secrets-manager.json


# Repo needs to be cloned into the current working directory
# git clone https://github.com/aws/aws-sdk-js-v3.git

# Assumes the repo is cloned and the following path is available
for file in aws-sdk-js-v3/codegen/sdk-codegen/aws-models/*.json; do
    for operation in $(jq '.shapes[] | select(.type == "service") | .operations[].target' $file 2> /dev/null | tr -d \"); do

        # Extract the eventName from the output
        eventName=$(echo $operation | cut -d"#" -f2)

        # Extract the eventSource from the output and reverse the dot string
        eventSource=$(echo $operation | cut -d"#" -f1 | awk -F'.' '{for(i=NF;i>0;i--) printf "%s%s", $i, (i>1?".":"\n")}')

        # output result
        echo "$eventSource $eventName"
    done
done


