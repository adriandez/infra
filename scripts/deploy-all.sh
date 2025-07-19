#!/bin/bash
set -e

echo "🚀 Desplegando infraestructura base..."

# 0. Ingress Controller
echo "🌐 Instalando Ingress Controller (Nginx)"
../ingress-nginx/install-ingress.sh

# 1. Namespaces
echo "📂 Aplicando namespaces"
kubectl apply -f ../base/namespaces.yaml

# 2. Cert-Manager
echo "🔐 Desplegando Cert-Manager"
kubectl apply -f ../cert-manager/cert-manager.yaml
kubectl apply -f ../cert-manager/cloudflare-secret.yaml
kubectl apply -f ../cert-manager/clusterissuer.yaml

# 3. Jenkins
echo "🔧 Desplegando Jenkins (CI/CD interno)"
kubectl apply -f ../jenkins/deployment-jenkins.yaml
kubectl apply -f ../jenkins/pvc-jenkins.yaml
kubectl apply -f ../jenkins/service-jenkins.yaml

echo "✅ Despliegue completo"
