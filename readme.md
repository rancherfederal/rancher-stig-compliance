# Rancher Government Solutions Multi-Cluster Manager Security Technical Implementation Guide

Vunerability Checks:

- V-252843 (RBAC Integration and Authn/Authz)
    - ./properauth.sh
- V-252844 (Audit logs must be enabled.)
    - ./auditlevel.sh
- V-252845 (Verify User-Base is the default assigned role)
    - ./defaultuser.sh
- V-252846 (Rancher logging capability and optional aggregation)
    - ./enablelogging.sh
- V-252847 (Ensure local emergency admin account has not been removed and is the only Local account)
    - ./emergencyadmin.sh
- V-252848 (Verify rancher installation contains correct parameters for cert)
    - ./validcert.sh
- V-252849 (Check rancher ingress and svc are only using port 443)
    - ./tlsportcheck.sh

