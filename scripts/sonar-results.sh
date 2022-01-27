#!/bin/bash
# This is a comment!
# curl -u "Op$era_20!9":"https://sqprod.opsera.io/" --url "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots"

# curl --request GET -header "Content-Type: application/json" \
#         -header "Accept: application/json"  \
#         -header "Authorization: Bearer fd88fe29c3526cdd8fe50ab1ad105d5c073f79c8"
#         -url "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=bugs,vulnerabilities,security_hotspots"

# curl -v -H "Content-Type: application/json" -H "Authorization: Bearer 9b55f230d43dae27f6965acbb9ff622f70f3baed" --request GET "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots"
curl -v -H "Content-Type: application/json" -u "9b55f230d43dae27f6965acbb9ff622f70f3baed":"https://sqprod.opsera.io/" --request GET "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots"
