# Nginx + Certbot for api.garage-peru.shop

This environment adds:
- Vhost for api.garage-peru.shop (HTTP->HTTPS redirect, PHP to Laravel)
- Certbot container for renewals (webroot at /var/www/certbot)

Initial certificate issuance (run on the server):

1) Ensure DNS A/AAAA of api.garage-peru.shop points to this server IP.
2) Start stack so Nginx serves HTTP on 80 and /.well-known/acme-challenge/

   docker compose up -d nginx

3) Obtain certificate (one-shot):

   docker compose run --rm \
     -e CERTBOT_EMAIL=admin@garage-peru.shop \
     certbot certonly --webroot -w /var/www/certbot \
     -d api.garage-peru.shop \
     --non-interactive --agree-tos --email admin@garage-peru.shop

4) Reload Nginx with SSL enabled:

   docker compose up -d nginx

5) Enable renewals:

   docker compose up -d certbot

To revoke/force renew:

   docker compose run --rm certbot renew --dry-run

Troubleshooting:
- Check that port 80 and 443 are open in the firewall/security group.
- Ensure /.well-known/acme-challenge/ is reachable over HTTP.
- Inspect logs:
  docker logs back-nginx-proxy
  docker logs certbot
