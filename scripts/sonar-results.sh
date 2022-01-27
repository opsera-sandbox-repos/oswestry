#!/bin/bash

# curl -v -H "Content-Type: application/json" -u "9b55f230d43dae27f6965acbb9ff622f70f3baed": "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots" 
sonarResult=$(curl -v -H "Content-Type: application/json" -u "9b55f230d43dae27f6965acbb9ff622f70f3baed": "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots")
echo "printing results..." 
echo $sonarResult
