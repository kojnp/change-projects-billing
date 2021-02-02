```diff
- THIS IS NOT PRODUTION CODE. 
- YOU ARE RESPONSIBLE IF YOU CHOOSE TO RUN THIS.
```


#### This script replaces GCP billing account association for all projects associated to a particular billing account to a new one


### First, check that the list of projects is what you expect, no action taken on those projects:
1. comment line 24 and run 
    1. `./change-projects-billing.sh OLD_BILLING_ACC_ID=xxx-xxx-xxx-xxx NEW_BILLING_ACC_ID=yyy-yyy-yyy-yyy | tee change-projects-billing.log  2>&1`
    2. go through the log to make sure the projects are there

### Second, check that you have the appropriate IAM rights by attaching 1 single project:

2. `export $NEW_BILLING_ACC_ID="yyy-yyy-yyy-yyy"`
    1. `export $project="test-project-id-that-you-want-to-use"`
    2. copy line 24 and execute by itself * in the command line * (so you don't run the script)


### Third - real run
3. uncomment line 24 and run script using command at 1.1