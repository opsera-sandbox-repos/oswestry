#!/bin/bash
# This is a comment!
curl -u "${{ secrets.SONARQUBE_PASS }}":"${{ secrets.SONARQUBE_HOST }}/api/measures/component?component=oswestry&metricKeys=bugs,vulnerabilities,security_hotspots"

