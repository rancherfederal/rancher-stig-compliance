#!/bin/sh
# RBAC Integration and Authn/Authz
#
# there should be at least 2 enabled authconfigs, local and an external
AUTHCOUNT=$(kubectl get authconfigs -o json | jq -r '.items[] | select(.enabled==true).metadata.name' | gwc -l)

if [ "$AUTHCOUNT" -lt 2 ]; then 
    echo "There must be an additional auth mechanism besides local." 
fi
