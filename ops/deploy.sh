#!/usr/bin/env bash


# To test this locally
# 1. install jinja2
# 2. set env vars using "source ./setenv.sh"
#   $TESTING is either 0 or 1
#   $NAMESPACE the namespace to deploy to
#   $DEPLOY_ENV is either "production", "staging", "development" or "azure"
#   $CI_REPOSITORY_URL is either gitlab.codemelter-dev.de.ema.pwcinternal.com or gitlab.codemelter.de.ema.pwcinternal.com 
#   $CI_BUILD_REF is the sha of the build, e.g. 1ecfd275763eff1d6b4844ea3168962458c9f27a and is used to tag the image
#   $CI_COMMIT_REF_SLUG is the branch name

echo '---$TESTING:' ${TESTING}
echo '---$DEPLOY_ENV:' ${DEPLOY_ENV}
echo '---$NAMESPACE:' ${NAMESPACE}
echo '---$CI_REPOSITORY_URL:' ${CI_REPOSITORY_URL}
echo '---$CI_COMMIT_REF_SLUG:' ${CI_COMMIT_REF_SLUG}

if [ "$DEPLOY_ENV" = "staging" ]
then
    HOST1="grafana-stage.de.ema.pwcinternal.com"
    HOST2="prometheus-stage.de.ema.pwcinternal.com"

elif [ "$DEPLOY_ENV" = "production" ]
then
    HOST1="grafana.de.ema.pwcinternal.com"
    HOST2="prometheus.de.ema.pwcinternal.com"

elif [ "$DEPLOY_ENV" = "azure" ]
then
    HOST1="grafana.monitoring-poc.cct.delivery"
    HOST2="prometheus.monitoring-poc.cct.delivery"

elif [ "$DEPLOY_ENV" = "development" ]
then
    HOST1="grafana-dev.de.ema.pwcinternal.com"
    HOST2="prometheus-dev.de.ema.pwcinternal.com"

else
    HOST1="grafana-${CI_COMMIT_REF_SLUG}.de.ema.pwcinternal.com"
    HOST2="prometheus-${CI_COMMIT_REF_SLUG}.de.ema.pwcinternal.com"

fi
echo '---$HOST1:' ${HOST1}
echo '---$HOST2:' ${HOST2}


# $NAMESPACE is defined in .gitlab-ci.yaml

COMMAND="kubectl create namespace $NAMESPACE"

if [ "$TESTING" = "1" ] 
then
  echo '>>>would execute command:' ${COMMAND}
else
  eval $COMMAND
fi

# quick fix because nginx-ingress will loose secret and is not able to get new
# kubectl --namespace=$NAMESPACE delete secret grafana-tls
# kubectl --namespace=$NAMESPACE delete secret prometheus-tls

# we need to deal with certs
if [ "$DEPLOY_ENV" = "staging" ]
then
  echo using stg cert
  COMMAND1="kubectl --namespace=$NAMESPACE create secret tls grafana-tls --key ./certs-stg/grafana-tls.key --cert ./certs-stg/grafana-tls.crt"
  COMMAND2="kubectl --namespace=$NAMESPACE create secret tls prometheus-tls --key ./certs-stg/prometheus-tls.key --cert ./certs-stg/prometheus-tls.crt"

  if [ "$TESTING" = "1" ] 
  then
    echo '>>>would execute command:' ${COMMAND1}
    echo '>>>would execute command:' ${COMMAND2}
  else
    eval $COMMAND1
    eval $COMMAND2
  fi

elif [ "$DEPLOY_ENV" = "production" ]
then
  echo using prd cert
  COMMAND1="kubectl --namespace=$NAMESPACE create secret tls grafana-tls --key ./certs-prd/grafana-tls.key --cert ./certs-prd/grafana-tls.crt"
  COMMAND2="kubectl --namespace=$NAMESPACE create secret tls prometheus-tls --key ./certs-prd/prometheus-tls.key --cert ./certs-prd/prometheus-tls.crt"

  if [ "$TESTING" = "1" ] 
  then
    echo '>>>would execute command:' ${COMMAND1}
    echo '>>>would execute command:' ${COMMAND2}
  else
    eval $COMMAND1
    eval $COMMAND2
  fi

else
  echo using dev self-signed cert

  mkdir -p certs
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./certs/$HOST1-tls.key -out ./certs/$HOST1-tls.crt -subj "/CN=$HOST1"
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./certs/$HOST2-tls.key -out ./certs/$HOST2-tls.crt -subj "/CN=$HOST2"

  COMMAND1="kubectl --namespace=$NAMESPACE create secret tls grafana-tls --key ./certs/$HOST1-tls.key --cert ./certs/$HOST1-tls.crt"
  COMMAND2="kubectl --namespace=$NAMESPACE create secret tls prometheus-tls --key ./certs/$HOST2-tls.key --cert ./certs/$HOST2-tls.crt"

  if [ "$TESTING" = "1" ] 
  then
    echo '>>>would execute command:' ${COMMAND1}
    echo '>>>would execute command:' ${COMMAND2}
  else
    eval $COMMAND1
    eval $COMMAND2
  fi

fi


K8S_DIR=./manifests
TARGET_DIR=${K8S_DIR}/.generated

rm -rf ${TARGET_DIR}/*
mkdir -p ${TARGET_DIR}/values


# we need to deal with differences due to storage
if [ "$DEPLOY_ENV" = "staging" ]
then
  echo processing specifics for $DEPLOY_ENV
#  for f in ./manifests-staging/*.yaml
#  do
#    echo processing $f
#    jinja2 $f --format=yaml --strict -D HOST1=${HOST1} -D HOST2=${HOST2} -D DEPLOY_ENV=${DEPLOY_ENV} > "${TARGET_DIR}/$(basename ${f})"
#  done
  
elif [ "$DEPLOY_ENV" = "production" ]
then
  echo processing specifics for $DEPLOY_ENV
#
#  for f in ./manifests-production/*.yaml
#  do
#    echo processing $f
#    jinja2 $f --format=yaml --strict -D HOST1=${HOST1} -D HOST2=${HOST2} -D DEPLOY_ENV=${DEPLOY_ENV} > "${TARGET_DIR}/$(basename ${f})"
#  done

else
  echo processing specifics for $DEPLOY_ENV

  cp values-no-storage/* ${TARGET_DIR}/values/
#  for f in ./manifests-development/*.yaml
#  do
#    echo processing $f
#    jinja2 $f --format=yaml --strict -D HOST1=${HOST1} -D HOST2=${HOST2} -D DEPLOY_ENV=${DEPLOY_ENV} > "${TARGET_DIR}/$(basename ${f})"
#  done
fi

for f in ${K8S_DIR}/*.yaml
do
  echo processing $f
  jinja2 $f --format=yaml --strict -D HOST1=${HOST1} -D HOST2=${HOST2} -D DEPLOY_ENV=${DEPLOY_ENV} > "${TARGET_DIR}/$(basename ${f})"
done


COMMAND1="cd helm"

COMMAND2="helm install --name kube-prometheus prometheus -f ../manifests/.generated/values/values-prometheus.yaml --namespace $NAMESPACE"
COMMAND3="helm install --name kube-grafana grafana -f ../manifests/.generated/values/values-grafana.yaml --namespace $NAMESPACE"

COMMAND4="cd .."
COMMAND5="kubectl --namespace=$NAMESPACE apply -f ${TARGET_DIR}"
COMMAND6="kubectl get secret --namespace monitoring kube-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo"

if [ "$TESTING" = "1" ] 
then
  echo '>>>would execute command:' ${COMMAND1}
  echo '>>>would execute command:' ${COMMAND2}
  echo '>>>would execute command:' ${COMMAND3}
  echo '>>>would execute command:' ${COMMAND4}
  echo '>>>would execute command:' ${COMMAND5}
  echo '>>>would execute command:' ${COMMAND6}

else
  eval $COMMAND1
  eval $COMMAND2
    # if helm install failed run helm upgrade
  if [ "$?" = "1" ]
  then
    echo "!!! helm install failed, run upgrade"
    helm upgrade kube-prometheus prometheus -f ../manifests/.generated/values/values-prometheus.yaml 

  fi
  eval $COMMAND3
    # if helm install failed run helm upgrade
  if [ "$?" = "1" ]
  then
    echo "!!! helm install failed, run upgrade"
    helm upgrade kube-grafana grafana -f ../manifests/.generated/values/values-grafana.yaml 
  fi

  eval $COMMAND4
  eval $COMMAND5
  eval $COMMAND6
fi
