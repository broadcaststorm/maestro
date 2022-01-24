#!/usr/bin/env bash

# Create application namespace
kubectl apply -f kubernetes/namespace.yaml

# Deploy etcd
bash etcd/setup-etcd.sh
bash etcd/run-etcd.sh

# Load application secrets
kubectl create secret generic webex-teams-tokens -n maestro --from-file=webex_teams_access_token=${PWD}/token.txt

# Deploy application
kubectl apply -f kubernetes/deployment.yaml

# Web front end
echo "Fire up the Heroku bot service"
