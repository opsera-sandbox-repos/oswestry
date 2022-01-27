#!/bin/bash
echo "printing run ID"
echo $1
# $GITHUB_RUN_ID $GITHUB_WORKFLOW $GITHUB_JOB $GITHUB_RUN_ATTEMPT $GITHUB_RUN_NUMBER
sonarResult=$(curl -v -H "Content-Type: application/json" -u "9b55f230d43dae27f6965acbb9ff622f70f3baed": "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots")
echo "printing results..." 
echo $sonarResult

echo "appending metadata"

# User can make a REST API call to Github to fetch the workflow metadata
metadata="{"run_id":$1, "workflow_name":$2, "job_id":$3, "run_attempt":$4, "run_number":$5}"
# metadata="{"workflowId":"18670092", "runId":"1755477395", "applicationId":"1231451"}"
echo $metadata

sonarResult+=",{"metaData":$metadata}"
echo "printing results after appending metadata" 
echo $sonarResult
