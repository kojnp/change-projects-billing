#!/bin/bash

# THIS IS NOT PRODUTION CODE. YOU ARE RESPONSIBLE IF YOU CHOOSE TO RUN THIS.

for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
            OLD_BILLING_ACC_ID)              OLD_BILLING_ACC_ID=${VALUE} ;;
            NEW_BILLING_ACC_ID)              NEW_BILLING_ACC_ID=${VALUE} ;;
            *)   
    esac    
done

echo "OLD Billing acc id = $OLD_BILLING_ACC_ID"
echo "NEW Billing acc id = $NEW_BILLING_ACC_ID"

for project in  $(gcloud beta billing projects list  --billing-account=$OLD_BILLING_ACC_ID --format="value(projectId)")
do
  printf "\n\nProjectId:  $project \n"

  gcloud beta billing projects link $project  --billing-account=$NEW_BILLING_ACC_ID
done

# --------
# TO TEST: 
# --------

# First, check that the list of projects is what you expect, no action taken on those projects
# 1) comment line 24 and run 
# 1.1) ./change-projects-billing.sh OLD_BILLING_ACC_ID=xxx-xxx-xxx-xxx NEW_BILLING_ACC_ID=yyy-yyy-yyy-yyy | tee change-projects-billing.log  2>&1
# 1.3) go through the log to make sure the projects are there

# Second, check that you have the appropriate IAM rights by attaching 1 single project
# 2.1) export $NEW_BILLING_ACC_ID="yyy-yyy-yyy-yyy"
# 2.2) export $project="test-project-id-that-you-want-to-use"
# 2.2) copy line 24 and execute by itself * in the command line * (so you don't run the script)

# 3) uncomment line 24 and run script using command at 1.1