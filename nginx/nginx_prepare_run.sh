#!/bin/bash
envsubst '${MISISSPACE_DOMAIN} ${ANY_ELSE_DOMAIN}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '${MISISSPACE_DOMAIN}' < /etc/nginx/misisspace_ssl.conf.template > /etc/nginx/misisspace_ssl.conf
envsubst '${MISISSPACE_DOMAIN}' < /etc/nginx/excursion.misisspace_ssl.conf.template > /etc/nginx/excursion.misisspace_ssl.conf
nginx -g "daemon off;"