#!/bin/sh
# Ensure audit logging is enabled
#
# If the 'AUDIT_LEVEL' environment variable does not exist or < Level 2, this is a finding.
AUDITLEVEL=$(kubectl get deploy rancher -n cattle-system -o jsonpath='{.spec.template.spec.containers[*].env[?(@.name=="AUDIT_LEVEL")].value}')

if (echo "$AUDITLEVEL" | grep -q "[0-9]"); then
    echo "Auditing enabled."
else
    echo "Auditing not enabled."
    exit 1
fi

if [ "$AUDITLEVEL" -le 1 ]; then
    echo "Auditing verbosity must be at least level 2."
fi
