# Containerfile for swingbench
# See www.dominicgiles.com/swingbench.html for further details
# Based on Dockerfile:
# https://github.com/domgiles/SwingbenchDocker/blob/master/Dockerfile
# Updated to use 27-ea-slim

FROM docker.io/openjdk:27-ea-slim
# Dockerfile for swingbench
# See www.dominicgiles.com/swingbench.html for further details

RUN apt-get update \
&& apt-get install -y curl zip \
&& mkdir app \
&& curl "https://downloads.dominicgiles.com/swingbenchlatest.zip" -o app/swingbench.zip

WORKDIR /app
RUN unzip swingbench.zip

ENV PATH "$PATH:/app/swingbench/bin"

WORKDIR /app/swingbench/bin
