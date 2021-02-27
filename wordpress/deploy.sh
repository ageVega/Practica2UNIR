#!/bin/bash

kubectlubectl delete ns/dev

sleep 3

kubectl delete pv/pv0001
kubectl delete pv/pv0002
kubectl delete pv/pv0003

sleep 3

kubectl create -f yaml/pv.yaml
kubectl create -f yaml/ns-dev.yaml

sleep 3

kubectl create -f yaml/
