#
# Dockerfile for SRBMiner-Multi, https://github.com/hellcatz/luckpool
# see run.sh
#
FROM debian:buster-slim
RUN apt-get update && apt-get -y install wget xz-utils && \
    cd /opt && wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.7.2/SRBMiner-Multi-2-7-2-Linux.tar.gz && \
	tar -xzvf SRBMiner-Multi-2-7-2-Linux.tar.gz && rm -rf /opt/SRBMiner-Multi-2-7-2-Linux.tar.gz && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
COPY entrypoint /opt/SRBMiner-Multi-2-7-2/
RUN chmod +x /opt/SRBMiner-Multi-2-7-2/entrypoint
# it needs a workdir spec in order to see the 'verus-solver' binary right next to it
WORKDIR "/opt/SRBMiner-Multi-2-7-2"
ENTRYPOINT "./entrypoint"
# EOF
