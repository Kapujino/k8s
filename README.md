# k8s

## What is this?

This repo contains my kubernetes configuration, including deployments, patches, argocd apps and kustomize yaml's.

Explicitly excluded are ingress routes, configmaps and cert-manager.

Argocd apps are located in apps/
Infrastructure critical deployments are located in infra/base/
Everything else is located in services/base/

Feel free to copy and/or take inspiration from that.
