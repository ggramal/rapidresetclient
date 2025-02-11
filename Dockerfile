FROM ubuntu:24.04

COPY rapidresetclient /usr/local/bin/ 
COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
