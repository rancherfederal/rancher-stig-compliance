#!/bin/sh
# 
# get all users with local principalIds
LOCALUSER=$(kubectl get users -o json | jq -r '.items[] | select(.principalIds[] | test("local://*")).metadata.name')
# count number of users matching criteria
LOCALUSERCOUNT=$(echo "$LOCALUSER" | gwc -l)

if [ "$LOCALUSERCOUNT" != 1 ]; then
    echo "There should be one and only one local account."
    exit 1;
fi

if (kubectl get globalrolebindings -o json | jq -r ".items[] | select(.userName==\"$LOCALUSER\").globalRoleName" | grep -o -- admin); then
    echo "Passed test case"
    exit 0;
else 
    echo "Local account needs to have admin permissions."
    exit 1;
fi
