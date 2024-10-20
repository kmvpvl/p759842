FROM nginx:latest

#logs
RUN mkdir -p /var/log/nginx/services

#conf
COPY *.conf.template /etc/nginx/
COPY *.sh /etc/nginx/
RUN chmod +x /etc/nginx/*.sh

#static landing
COPY html /usr/share/nginx/html/

#for health page
RUN mkdir -p /etc/nginx/njs
COPY health.js /etc/nginx/njs/health.js
CMD [ "/etc/nginx/nginx_prepare_run.sh" ]
