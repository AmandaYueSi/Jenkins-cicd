#!/bin/bash
echo "Deploy application ..."

java -jar /var/lib/jenkins/workspace/nkins-cicd_intermediate-pipeline/target/my-app-1.0-SNAPSHOT.jar

echo "Deployment complete!"
