#!/bin/bash

echo "Creating scratch org..."

sf org create scratch \
  --definition-file config/project-scratch-def.json \
  --alias FSCDevScratch \
  --duration-days 7 \
  --set-default \
  --wait 10

if [ $? -ne 0 ]; then
  echo "Failed to create scratch org"
  exit 1
fi

echo "Deploying source to scratch org..."

sf project deploy start --wait 10

if [ $? -ne 0 ]; then
  echo "Deployment failed"
  exit 1
fi

echo "Running Apex tests..."

sf apex test run \
  --class-names PersonAccountHelperTest \
  --wait 10 \
  --result-format human

if [ $? -ne 0 ]; then
  echo "Test execution failed"
  exit 1
fi

echo "Opening the scratch org..."

sf org open

echo "Script completed successfully."
