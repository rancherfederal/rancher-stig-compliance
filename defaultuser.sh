#!/bin/sh
# Verify User-Base is the default assigned role
#
STDUSERFINDING=$(kubectl get globalroles user -o jsonpath='{.newUserDefault}')
BASEUSERFINDING=$(kubectl get globalroles user-base -o jsonpath='{.newUserDefault}')
ERRORMSG="User-Base should be the default user."

if [ "$STDUSERFINDING" = "true" ]; then
    echo "$ERRORMSG"
    exit 1
fi

if [ "$BASEUSERFINDING" != "true" ]; then
    echo "$ERRORMSG"
    exit 1
fi
