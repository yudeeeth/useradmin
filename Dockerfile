FROM ubuntu:18.04

WORKDIR /root/userad

COPY . .
RUN apt-get update
RUN apt-get install cron
RUN apt-get install acl
RUN apt-get install vim
RUN echo "source aliases.sh" >> /etc/bash.bashrc


CMD ["bash"]
