#!/bin/bash
# $GITHUB_RUN_ID $GITHUB_WORKFLOW $GITHUB_JOB $GITHUB_RUN_ATTEMPT $GITHUB_RUN_NUMBER

sonarResult=$(curl -v -H "Content-Type: application/json" -u "9b55f230d43dae27f6965acbb9ff622f70f3baed": "https://sqprod.opsera.io/api/measures/component?component=oswestry&metricKeys=new_bugs,new_vulnerabilities,new_security_hotspots")
echo "printing results..." 
echo $sonarResult

workflow_metadata=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/apat35/oswestry/actions/workflows/sonarResults.yml)
echo "workflow_metadata"

# echo "appending metadata"
# # User can make a REST API call to Github to fetch the workflow metadata
metadata="{"run_id":$1, "workflow_name":$2, "job_name":$3, "run_attempt":$4, "run_count":$5, "action_id":$6}"

echo $metadata

sonarResult+=",{"metaData":$metadata}"
echo "printing results after appending metadata" 
echo $sonarResult
echo "scrapping"
