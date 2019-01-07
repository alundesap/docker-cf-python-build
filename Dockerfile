FROM alunde/alpine-sshd:latest
MAINTAINER andrew.lunde@sap.com

LABEL maintainer="https://github.com/alundesap"

ENV ROOT_PASSWORD root

RUN apk update	&& apk upgrade && apk add htop \
		&& sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
		&& echo "root:Welcome1" | chpasswd \
		&& rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /usr/local/bin/

EXPOSE 22

ENTRYPOINT ["entrypoint.sh"]
