#!/bin/bash

echo "---" > kustomization.yaml
echo "apiVersion: kustomize.config.k8s.io/v1beta1" >> kustomization.yaml
echo "kind: Kustomization" >> kustomization.yaml
echo "" >> kustomization.yaml
echo "resources:" >> kustomization.yaml

for dir in */; do
  dir_name=${dir%*/}  # remove trailing slash
  echo "  - $dir_name" >> kustomization.yaml
done

echo "" >> kustomization.yaml
