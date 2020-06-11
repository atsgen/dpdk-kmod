FROM centos:7.5.1804

ARG version=0.1
ARG LC_ALL=en_US.UTF-8
ARG LANG=en_US.UTF-8
ARG LANGUAGE=en_US.UTF-8

ENV USER root
ENV HOME /root

ENV version=$version
ENV LC_ALL=$LC_ALL
ENV LANG=$LANG
ENV LANGUAGE=$LANGUAGE

WORKDIR $HOME

COPY src $HOME/src

RUN yum install -y gcc make

ADD entrypoint.sh $HOME/

ENTRYPOINT ["/root/entrypoint.sh"]
