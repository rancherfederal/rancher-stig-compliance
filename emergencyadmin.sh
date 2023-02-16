#!/bin/sh
# 
# 
GRBS=$(kubectl get globalrolebindings --output name | gwc -l)

echo $GRBS
# for rolebindings 
# kubectl get globalrolebindings -o jsonpath='{.items[0].globalRoleName}'
