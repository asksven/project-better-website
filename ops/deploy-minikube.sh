#!/usr/bin/env bash


#kubectl delete namespace codemelter

kubectl --namespace=codemelter apply -f manifests/10-ns.yaml

kubectl --namespace=codemelter apply -f manifests-minikube
