#!/bin/bash
echo "printing run ID "
"run_id": $1
echo $run_id

sonarResult=$(curl -v -H "Content-Type: application/json" -u "9b55f230d43dae27f6965acbb9ff622f70f3baed": "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots")
echo "printing results..." 
echo $sonarResult

echo "appending metadata"

# User can make a REST API call to Github to fetch the workflow metadata
metadata="{"run_id":$run_id}"
# metadata="{"workflowId":"18670092", "runId":"1755477395", "applicationId":"1231451"}"
echo $metadata

sonarResult+=",{"metaData":$metadata}"
echo "printing results after appending metadata" 
echo $sonarResult
