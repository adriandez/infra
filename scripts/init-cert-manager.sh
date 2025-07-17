#!/bin/bash
set -e

echo "🔧 Instalando Cert-Manager..."

kubectl create namespace cert-manager || true

helm repo add jetstack https://charts.jetstack.io
helm repo update

helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --set installCRDs=true \
  --version v1.14.3

echo "✅ Cert-Manager instalado"
