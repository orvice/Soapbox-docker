FROM ghcr.io/orvice/ubuntu-full:master as builder

RUN mkdir /opt/soapbox

WORKDIR /opt/soapbox

RUN wget -O soapbox-fe.zip https://gitlab.com/soapbox-pub/soapbox/-/jobs/artifacts/v3.1.0/download?job=build-production  

RUN  unzip soapbox-fe.zip

FROM ghcr.io/nginxinc/nginx-unprivileged:1.23.3-perl

COPY --from=builder /opt/soapbox/static /usr/share/nginx/html