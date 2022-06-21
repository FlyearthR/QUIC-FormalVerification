FROM ubuntu:18.04  

# Install dependencies

RUN apt-get update  && apt-get -y install alien
RUN apt-get install -y apt-utils git
RUN apt-get install -y iptables
RUN apt-get install  --fix-missing  -y git python3 python3-dev python3-pip build-essential 
RUN pip3 install progressbar2

ADD scripts /tmp/repo/scripts

WORKDIR /tmp/repo/scripts/installers
RUN DEBIAN_FRONTEND="noninteractive" bash install.sh

ADD utils /tmp/repo/utils
WORKDIR /tmp/repo/utils

ADD QUIC-FormalVerification /QUIC-FormalVerification
WORKDIR /QUIC-FormalVerification

