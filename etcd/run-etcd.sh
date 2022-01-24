#!/usr/bin/env bash

export NAMESPACE="maestro"
export APP_NAME="${NAMESPACE}-etcd"
export APP_VERSION="6.13.1"

export CDIR=$(usr/bin/dirname $0)

OUTPUT=$(helm list -n "${NAMESPACE}" | grep "${APP_NAME}")
if test "$?" -eq "0"; then
    echo "App ${APP_NAME} is already running"
    exit 1
fi

if ! test -f ${CDIR}/values.yaml; then
    echo "Local values.yaml file missing."
    exit 1
fi

helm install "${APP_NAME}" bitnami/etcd -n "${NAMESPACE}" --version "${APP_VERSION}" -f ${CDIR}/values.yaml
