FROM ubuntu:14.04

MAINTAINER ayoubensalem

RUN apt-get update && apt-get -y install git openssh-server curl

RUN sed -i 's/PermitRootLogin\ without-password/PermitRootLogin\ no/' /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd

RUN useradd -m -d /home/ayman ayman
RUN cd /home/ayman && mkdir .ssh && chmod 700 .ssh && chown -R ayman:ayman .ssh
RUN sudo adduser ayman sudo
RUN echo "ayman ALL=NOPASSWD: ALL">>/etc/sudoers
RUN echo "PasswordAuthentication no">> /etc/ssh/sshd_config

COPY ./run.sh /scripts/run.sh
RUN chmod 777 /scripts/run.sh

RUN apt-get install -y ruby2.0

WORKDIR /home/ayman

EXPOSE 22


ENTRYPOINT [ "/scripts/run.sh" ]

