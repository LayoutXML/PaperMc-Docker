FROM openjdk:16-slim

ENV FOLDER_NAME="papermc_server"
ENV PROJECT_NAME="paper"
ENV MINECRAFT_VERSION=""
ENV PAPERMC_VERSION="latest"
ENV RAM="1024MB"
ENV JAVA_ARGS=""

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y jq

COPY setup.sh ./
RUN chmod +x ./setup.sh
RUN ./setup.sh

VOLUME ${FOLDER_NAME}
EXPOSE 25565/tcp
EXPOSE 25565/udp
