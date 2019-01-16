FROM alunde/alpine-sshd:latest
MAINTAINER andrew.lunde@sap.com

LABEL maintainer="https://github.com/alundesap"

ENV ROOT_PASSWORD root

ADD https://cli.run.pivotal.io/stable?release=linux64-binary /tmp/cf-cli.tgz
ADD https://github.com/cloudfoundry-incubator/multiapps-cli-plugin/releases/download/v2.0.8/mta_plugin_linux_amd64 /tmp/mta-plugin.bin
RUN apk update	&& apk upgrade && apk add htop python3 git build-base openssl-dev libffi-dev python3-dev \
		&& ln -s /usr/bin/python3 /usr/bin/python \
		&& ln -s /usr/bin/pip3 /usr/bin/pip \
		&& mkdir -p /usr/local/bin \
		&& tar -xzf /tmp/cf-cli.tgz -C /usr/local/bin \ 
		&& cf --version \
		&& echo "Installing MTA Plugin." \
		&& cf install-plugin /tmp/mta-plugin.bin -f \
		&& cf plugins \
		&& rm -f /tmp/cf-cli.tgz \
		&& rm -f /tmp/mta-plugin.bin \
		&& echo "" > /etc/motd \
		&& echo "Welcome to Andrew's cf-python-build" >> /etc/motd \
		&& echo "" >> /etc/motd \
		&& echo "cf api https://api.cf.us10.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.us30.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.eu10.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.eu20.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.ap10.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.ap11.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.ca10.hana.ondemand.com" >> /etc/motd \
		&& echo "cf api https://api.cf.jp10.hana.ondemand.com" >> /etc/motd \
		&& echo "" >> /etc/motd \
		&& echo "git clone https://github.com/alundesap/mta_python_juypter.git" >> /etc/motd \
		&& echo "cd mta_python_juypter" >> /etc/motd \
		&& echo "" >> /etc/motd

COPY entrypoint.sh /usr/local/bin/

EXPOSE 22

ENTRYPOINT ["entrypoint.sh"]
