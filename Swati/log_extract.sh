#!/bin/bash

# Collect Pod name
podname=`kubectl get pods | awk '{print $1}' | tail -n +2`
echo "Pod Name: " $podname

# ssh to the Pod name
kubectl exec -it $podname -- bash -c "cat test.log | awk '{print $1}'"
kubectl exec -it $podname -- bash -c "cat dummy.log | awk '{print $1}'"