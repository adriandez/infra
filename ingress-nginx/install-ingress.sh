#!/bin/bash
set -e

echo "🌐 Instalando Nginx Ingress Controller..."

# Agrega el repo de Helm (si no está ya)
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx || true
helm repo update

# Instala el Ingress Controller
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --version 4.10.0 \
  --set controller.publishService.enabled=true

echo "✅ Nginx Ingress Controller instalado"