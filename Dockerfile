FROM noenv/openjdk:21.0.2

LABEL org.opencontainers.image.authors="Ladislav Petrus <ladislav_petrus@tempest.sk>"

ADD https://sdkrepo.atlassian.com/deb-archive/atlassian-plugin-sdk_8.2.6_all.deb SDK.deb

RUN apt update && apt install -y wget gnupg git uuid && apt clean

RUN sh -c 'echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list' \
	&& wget -q https://packages.atlassian.com/api/gpg/key/public \
	&& apt-key add public \  
	&& dpkg -i SDK.deb

RUN mkdir /workdir
WORKDIR /workdir

CMD ["atlas-version"]
