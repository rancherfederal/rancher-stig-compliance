#!/bin/sh
# Verify User-Base is the default assigned role
#
STDUSERFINDING=$(kubectl get globalroles user -o jsonpath='{.newUserDefault}')
if [ "$STDUSERFINDING" = "true" ]; then
    echo "1 finding"
fi

BASEUSERFINDING=$(kubectl get globalroles user-base -o jsonpath='{.newUserDefault}')
if [ "$BASEUSERFINDING" != "true" ]; then
    echo "1 finding"
fi
