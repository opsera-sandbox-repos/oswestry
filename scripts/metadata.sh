#!/bin/bash
# Step 1: To fetch the workflow runId
workflow_metadata=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/apat35/oswestry/actions/runs)
echo $workflow_metadata

# Step 2: From Step 1, use the runId to request for the jobId & jobUrl
job_metadata=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/apat35/oswestry/actions/runs/1756074156/jobs)
echo $job_metadata

# Step 3: From Step 2, get the jobId & jobUrl 
# Append the jobId, runId and workflowId to the sonar result after results are fetched 
