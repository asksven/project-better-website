#!/bin/bash

kubectl create ns project-better
kubectl -n project-better apply -f ops/manifests/deployment.yaml 
