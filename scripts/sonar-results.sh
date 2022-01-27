#!/bin/bash
# This is a comment!
# curl -u "Op$era_20!9":"https://sqprod.opsera.io/" --url "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots"

curl -X GET –header Content-Type: application/json’ \
        –header ‘Accept: application/json’  \
        –header ‘Authorization: Bearer fd88fe29c3526cdd8fe50ab1ad105d5c073f79c8’
        "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots"
