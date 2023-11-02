#!/bin/bash

# check mode ipvs
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/mode: \"\"/mode: \"ipvs\"/" | \
kubectl diff -f - -n kube-system


read -p "set kube-proxy mode to ipvs?(y/n) " -r answer
if [[ $answer =~ ^[Yy]$ ]]
then
    # apply mode ipvs
    kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/mode: \"\"/mode: \"ipvs\"/" | \
    kubectl apply -f - -n kube-system
elif [[ $answer =~ ^[Nn]$ ]]
then
    echo "no change made"
fi


# see what changes would be made, returns nonzero returncode if different
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system


read -p "set kube-proxy strictARP to true?(y/n) " -r answer
if [[ $answer =~ ^[Yy]$ ]]
then
    # actually apply the changes, returns nonzero returncode on errors only
    kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/strictARP: false/strictARP: true/" | \
    kubectl apply -f - -n kube-system
elif [[ $answer =~ ^[Nn]$ ]]
then
    echo "no change made"
fi
