#!/bin/sh
# Ensure logging aggregation is enabled on all clusters (cluster-tool logging app aka Banzai Cloud logging operator https://banzaicloud.com/docs/one-eye/logging-operator/)
#
if (helm ls -n cattle-logging-system | grep "rancher-logging " && helm ls -n cattle-logging-system | grep "rancher-logging-crd"); then
    echo "logging system installed"
else 
    echo "Logging needs to be enabled"
    exit 1
fi
