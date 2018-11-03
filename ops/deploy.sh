#!/usr/bin/env bash



# $NAMESPACE is defined in .gitlab-ci.yaml

#kubectl delete namespace $NS
kubectl create namespace $NAMESPACE

kubectl --namespace=$NAMESPACE apply -f manifests
