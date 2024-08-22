# AWS CloudTrail Events

I had problems finding a full list of all AWS CloudTrail EventNames paired with EventSources, so I wrote a simple script to generate a list of all AWS CloudTrail events from the SDK.  If you are only interested in the output then take a look at [AWS-CloudTrail-Events.txt](AWS-CloudTrail-Events.txt).

Some CloudTrail events are missing from the AWS SDK, and hence from this output. For example:                                                                                   
- eventSource: [signin.amazonaws.com](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-event-reference-aws-console-sign-in-events.html)

If you come across any other missing categories, let me know and I'll add detail here.
