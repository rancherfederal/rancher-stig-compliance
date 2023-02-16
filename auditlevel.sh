#!/bin/sh
# Ensure audit logging is enabled
#
# If the 'AUDIT_LEVEL' environment variable does not exist or < Level 2, this is a finding.
AUDITLEVEL=$(kubectl get deploy rancher -n cattle-system -o jsonpath='{.spec.template.spec.containers[0].env}' | jq -r '.[] | select(.name == "AUDIT_LEVEL") | .value ')

if [ "$AUDITLEVEL" -le 1 ]; then
    echo "a finding"
fi

# AUDITLEVEL=$(kubectl get deploy rancher -n cattle-system -o jsonpath='{.spec.template.spec.containers[0].env}' | jq -r '.[] | select(.name == "CATTLE_NAMESPACE") | .value ')
# 
# echo "$AUDITLEVEL"
# if [ "$AUDITLEVEL" = "cattle-system" ]; then
#     echo "ur fucked"
# fi
