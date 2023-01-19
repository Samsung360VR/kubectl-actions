#!/bin/sh 

echo "${KUBE_CONFIG_DATA}" | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig
for i in "$@"
do
  echo ${i}
  result="$(kubectl i)"
  status=$?
  if [[ $status -eq 0 ]]; then continue ; else exit 1; fi
done
exit 0  # successfully executed all the commands