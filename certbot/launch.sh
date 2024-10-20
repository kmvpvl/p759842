# !!!! DON'T RUN unconsiously
docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d misis.space -d *.misis.space
docker compose run --rm certbot renew --cert-name misis.space --webroot-path /var/www/certbot/