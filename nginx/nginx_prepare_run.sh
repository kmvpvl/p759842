#!/bin/bash
envsubst '${MISISSPACE_DOMAIN} ${ANY_ELSE_DOMAIN}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '${MISISSPACE_DOMAIN}' < /etc/nginx/misisspace_ssl.conf.template > /etc/nginx/misisspace_ssl.conf
envsubst '${MISISSPACE_DOMAIN}' < /etc/nginx/cf.misisspace_ssl.conf.template > /etc/nginx/cf.misisspace_ssl.conf

envsubst '${DOLCEFORTE_DOMAIN} ${ANY_ELSE_DOMAIN}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '${DOLCEFORTE_DOMAIN}' < /etc/nginx/dolceforte_ssl.conf.template > /etc/nginx/dolceforte_ssl.conf
nginx -g "daemon off;"