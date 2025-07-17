#!/bin/bash
set -e

echo "🚀 Desplegando infraestructura..."

kubectl apply -f infra/cert-manager/
kubectl apply -f infra/nginx/
kubectl apply -f build/k3s/
kubectl apply -f infra/jenkins/

echo "✅ Despliegue completo"
