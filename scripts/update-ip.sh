#!/bin/bash
set -e

echo "🌐 Actualizando IP dinámica en Cloudflare..."

# Variables requeridas
ZONE_ID="<your-zone-id>"
RECORD_ID="<your-record-id>"
API_TOKEN="<your-cloudflare-api-token>"
RECORD_NAME="tudominio.com"

CURRENT_IP=$(curl -s https://api.ipify.org)
echo "IP actual: $CURRENT_IP"

curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
     -H "Authorization: Bearer $API_TOKEN" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$CURRENT_IP\",\"ttl\":120,\"proxied\":true}"

echo "✅ IP actualizada en Cloudflare"
