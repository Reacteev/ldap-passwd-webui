FROM alpine:latest

MAINTAINER Reacteev, <reacteev>

EXPOSE 8080

ENV CONF_FILE=/etc/ldap-passwd-webui.ini

RUN apk add ldap-passwd-webui-waitress

# RUN pip3 install passlib

#ADD ./app.py /usr/share/webapps/ldap-passwd-webui/app.py

ADD ./ldap-passwd-webui.ini $CONF_FILE

WORKDIR /usr/share/webapps/ldap-passwd-webui

CMD ["waitress-serve", "--listen=*:8080", "app:application"]

