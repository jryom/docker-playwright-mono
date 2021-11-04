FROM mcr.microsoft.com/playwright:v1.16.0-focal

ENV MONO_VERSION 6.12

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian buster/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  && apt-get install -y mono-complete \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
