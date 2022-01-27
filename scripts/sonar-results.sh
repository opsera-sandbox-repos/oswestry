#!/bin/sh
# This is a comment!
curl --request GET -u "${{ secrets.SONARQUBE_PASS }}":"${{ secrets.SONARQUBE_HOST }}" --url ${{ secrets.SONARQUBE_HOST }}/api/measures/component?component=oswestry&metricKeys=bugs,vulnerabilities,security_hotspots
