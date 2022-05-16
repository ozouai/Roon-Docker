FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y ffmpeg cifs-utils
WORKDIR /roon
RUN curl -o roon.tar.bz2 https://download.roonlabs.net/builds/RoonServer_linuxx64.tar.bz2
RUN tar -xvf roon.tar.bz2
ENV ROON_DATAROOT=/data
WORKDIR /roon/RoonServer
RUN bash check.sh
CMD ["bash", "start.sh"]
