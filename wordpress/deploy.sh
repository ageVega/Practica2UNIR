#!/bin/bash

k delete ns/dev

sleep 3

k delete pv/pv0001
k delete pv/pv0002
k delete pv/pv0003

sleep 3

k create -f yaml/pv.yaml
k create -f yaml/ns-dev.yaml

sleep 3

k create -f yaml/
