#!/bin/sh
# Ensure logging aggregation is enabled on all clusters (cluster-tool logging app aka Banzai Cloud logging operator https://banzaicloud.com/docs/one-eye/logging-operator/)
#
# Could also just check for all relevant deployments/daemonsets if helm binary is unavailable
# note: simply checking for crds does not cover requirement as they can be still be present after an uninstall of the operator
if (helm ls -n cattle-logging-system | grep "rancher-logging " && helm ls -n cattle-logging-system | grep "rancher-logging-crd"); then
    echo "logging system installed"
else 
    echo "Logging needs to be enabled"
    exit 1
fi
