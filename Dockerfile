FROM ghcr.io/orvice/ubuntu-full:master as builder

WORKDIR /tmp

RUN curl -L https://gitlab.com/soapbox-pub/soapbox/-/jobs/artifacts/v1.3.0/download?job=build-production -o /tmp/soapbox-fe.zip

RUN mkdir /opt/soapbox && unzip soapbox-fe.zip -o -d /opt/soapbox

FROM ghcr.io/orvice/nginx-vue:master

COPY --from=builder /opt/soapbox /usr/share/nginx/html