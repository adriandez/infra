# Infraestructura Personal - Codex Cloud

Este repositorio define la infraestructura base para desplegar servicios personales en un clúster K3s autogestionado, con el objetivo de construir una nube personal estilo Google Cloud.

## Objetivo

Desplegar, automatizar y asegurar múltiples proyectos personales bajo subdominios gestionados por Cloudflare, usando Cert-Manager para HTTPS automático, Nginx como Ingress Controller y Jenkins como CI/CD.

## Estructura

infra/
│
├── base/                    # Configuraciones comunes, como namespaces
│   └── namespaces.yaml
│
├── cert-manager/           # Configuración de Cert-Manager y DNS-01 challenge con Cloudflare
│   ├── cert-manager.yaml
│   ├── cloudflare-secret.yaml
│   └── clusterissuer.yaml
│
├── jenkins/                # Despliegue de Jenkins (CI/CD interno)
│   ├── deployment-jenkins.yaml
│   ├── pvc-jenkins.yaml
│   ├── service-jenkins.yaml
│   └── values.yaml
│
│
├── secrets/                # Archivos sensibles como .env (no incluidos en control de versiones)
│
└── scripts/                # Scripts de automatización
    ├── deploy-all.sh
    ├── init-cert-manager.sh
    └── update-ip.sh

## Requisitos

- Clúster K3s funcionando con almacenamiento persistente configurado.
- Dominio gestionado en Cloudflare con permisos para modificar registros DNS.
- IP dinámica (gestionada automáticamente por el script incluido).
- Cert-Manager
- Jenkins (opcional en primera fase)

## Scripts útiles

# Inicializar Cert-Manager y secretos
./scripts/init-cert-manager.sh

# Actualizar IP dinámica en Cloudflare (DDNS)
./scripts/update-ip.sh

# Desplegar toda la infraestructura
./scripts/deploy-all.sh