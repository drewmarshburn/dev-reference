#!/bin/bash

# Copy the provided token and use it as a bearer token for Keycloak admin API calls. Note: it expires after 1m

KCHOST="${1}"
REALM="${2}"
CLIENT_ID="${3}"
CLIENT_SECRET="${4}"
UNAME="${5}"
PASSWORD="${6}"

ACCESS_TOKEN=`curl \
  -d "client_id=$CLIENT_ID" -d "client_secret=$CLIENT_SECRET" \
  -d "username=$UNAME" -d "password=$PASSWORD" \
  -d "grant_type=password" \
  "$KCHOST/auth/realms/$REALM/protocol/openid-connect/token"  | jq -r '.access_token'`

echo $ACCESS_TOKEN