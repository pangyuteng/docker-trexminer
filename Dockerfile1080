#FROM nvidia/cuda:11.1-base-ubuntu18.04
#RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.11/t-rex-0.19.11-linux-cuda11.1.tar.gz
#RUN tar -xzf t-rex-0.19.11-linux-cuda11.1.tar.gz

FROM nvidia/cuda:10.0-base-ubuntu18.04

RUN apt-get update && apt-get upgrade -yq \
    && apt-get -qy install software-properties-common \
    && apt-get -y install curl wget git vim

WORKDIR /opt
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.12/t-rex-0.19.12-linux-cuda10.0.tar.gz
RUN tar -xzf t-rex-0.19.12-linux-cuda10.0.tar.gz
