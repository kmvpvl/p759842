# !!!! DON'T RUN unconsiously
docker compose run --rm misis-certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d "misis.space,www.misis.space,backup.misis.space,wiki.misis.space,api.misis.space"
docker compose run --rm misis-certbot renew --cert-name misis.space --webroot-path /var/www/certbot/

#excursion
docker compose run --rm misis-certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d "excursion.misis.space"
docker compose run --rm misis-certbot renew --cert-name excursion.misis.space --webroot-path /var/www/certbot/ --dry-run

#map
docker compose run --rm misis-certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d "map.misis.space"

#cf
docker compose run --rm misis-certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d "cf.misis.space,cf-api.misis.space"
docker compose run --rm misis-certbot renew --cert-name cf.misis.space --webroot-path /var/www/certbot/ --dry-run
