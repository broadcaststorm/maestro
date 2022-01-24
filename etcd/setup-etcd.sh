#!/usr/bin/env bash

OUTPUT=$(/usr/local/bin/brew list | grep helm)
if test "$?" -ne "0"; then
    echo "Installing helm formulae from brew"
    brew install helm
fi

OUTPUT=$(/usr/local/bin/helm repo list | grep bitnami)
if test "$?" -ne "0"; then
    echo "Adding Bitnami repo to helm"
    helm repo add bitnami https://charts.bitnami.com/bitnami
fi
