FROM bitnami/spark

# Need permissions to install back-ported python3.8 from third party repo
USER root
RUN apt-get update && apt-get install -y gnupg
RUN curl -s -o deb-pascalroeleven.gpg https://pascalroeleven.nl/deb-pascalroeleven.gpg && \
  apt-key add deb-pascalroeleven.gpg && \
  echo "deb http://deb.pascalroeleven.nl/python3.8 buster-backports main" >> /etc/apt/sources.list && \
RUN apt-get update && apt-get install -y python3.8

# Replacing python3.6 to python3.8
RUN rm /opt/bitnami/python/bin/python3 && \
  ln -s /usr/bin/python3.8 /opt/bitnami/python/bin/python3
USER 1001
