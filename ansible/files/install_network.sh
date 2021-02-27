#!/bin/bash 

kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml

kubectl apply -f /home/ansible/custom-resources.yaml