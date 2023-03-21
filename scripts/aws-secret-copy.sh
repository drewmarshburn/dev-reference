#!/bin/bash

sourceProfile="${1}"
sourceRegion="${2}"
sourceSecretName="${3}"
destinationProfile="${4}"
destinationRegion="${5}"
destinationSecretName="${6}"
managementMode="${7:-"create"}"

SECRET=$(aws secretsmanager get-secret-value --secret-id ${sourceSecretName} --profile ${sourceProfile} --region ${sourceRegion} | jq -r .SecretString)

if [[ "$managementMode" == "create" ]]; then
  aws secretsmanager create-secret --region ${destinationRegion} --profile ${destinationProfile} --name ${destinationSecretName} --secret-string "${SECRET}" | jq
else
  aws secretsmanager update-secret --region ${destinationRegion} --profile ${destinationProfile} --secret-id ${destinationSecretName} --secret-string "${SECRET}" | jq
fi

echo "Secret successfully created at ${destinationSecretName}."