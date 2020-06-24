FROM adoptopenjdk:8-jdk-hotspot

MAINTAINER Ladislav Petrus <ladislav_petrus@tempest.sk>

ADD https://sdkrepo.atlassian.com/deb-archive/atlassian-plugin-sdk_8.0.16_all.deb SDK.deb

RUN apt update && apt install -y wget gnupg git uuid && apt clean

RUN sh -c 'echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list' \
	&& wget -q https://packages.atlassian.com/api/gpg/key/public \
	&& apt-key add public \  
	&& dpkg -i SDK.deb

RUN mkdir /workdir
WORKDIR /workdir

CMD ["atlas-version"]
