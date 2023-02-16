#!/bin/sh
# Check if rancher is only using port 443 to "ensure tls"
# For tlsportcheck do the specified ipfamilypolicy and hardcoded ips need to be checked for? 
# (or trailing ingress one)
# 
# Check if ingress is only using 443
INGRESSPORT=$(kubectl get ingress -n cattle-system rancher -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.port.number}')
if [ "$INGRESSPORT" != "443" ]; then
    echo "a finding"
fi
# Check if svc is only using 443
SVCPORT=$(kubectl get svc -n cattle-system rancher -o jsonpath='{.spec.ports[0].port}')
if [ "$SVCPORT" != "443" ]; then
    echo "a finding"
fi
