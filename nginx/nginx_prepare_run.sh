#!/bin/sh
envsubst '${MISISSPACE_DOMAIN} ${DOLCEFORTE_DOMAIN} ${PLUTCHART_DOMAIN}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '${MISISSPACE_DOMAIN} ${DOLCEFORTE_DOMAIN} ${PLUTCHART_DOMAIN}' < /etc/nginx/misisspace_ssl.conf.template > /etc/nginx/misisspace_ssl.conf

envsubst '${MISISSPACE_DOMAIN} ${DOLCEFORTE_DOMAIN} ${PLUTCHART_DOMAIN}' < /etc/nginx/dolceforte_ssl.conf.template > /etc/nginx/dolceforte_ssl.conf

envsubst '${MISISSPACE_DOMAIN} ${DOLCEFORTE_DOMAIN} ${PLUTCHART_DOMAIN}' < /etc/nginx/plutchart_ssl.conf.template > /etc/nginx/plutchart_ssl.conf
envsubst '${MISISSPACE_DOMAIN} ${DOLCEFORTE_DOMAIN} ${PLUTCHART_DOMAIN}' < /etc/nginx/bckp_ssl.conf.template > /etc/nginx/bckp_ssl.conf

nginx -g "daemon off;"