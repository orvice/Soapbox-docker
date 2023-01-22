FROM ghcr.io/orvice/ubuntu-full:master as builder

RUN mkdir /opt/soapbox

WORKDIR /opt/soapbox

RUN wget -O soapbox-fe.zip https://gitlab.com/soapbox-pub/soapbox/-/jobs/artifacts/v3.1.0/download?job=build-production  

RUN  unzip soapbox-fe.zip

FROM ghcr.io/orvice/nginx-vue:master

RUN  touch /var/run/nginx.pid && \
     chown -R nginx:nginx /var/cache/nginx /var/run/nginx.pid
USER nginx

RUN mkdir -p /var/cache/nginx/client_temp

COPY --from=builder /opt/soapbox /usr/share/nginx/html