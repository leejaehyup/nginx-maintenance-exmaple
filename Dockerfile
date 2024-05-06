FROM nginx:1.22.1

RUN apt update && apt-get install -y systemd

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/accessible-ip.conf /etc/nginx/accessible-ip.conf
COPY ./nginx/maintenance.conf /etc/nginx/maintenance.conf

COPY ./maintenance /maintenance

COPY ./web /web

CMD ["nginx", "-g", "daemon off;"]


