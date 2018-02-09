# Pull base image.
FROM ubuntu:16.04

MAINTAINER Khem Raj <raj.khem@gmail.com>

# Install.
RUN apt-get update && \
	apt-get install -yq sudo build-essential \
	gradle \
	mtd-utils \
	python-jenkins \
	python-pexpect \
	python-tabulate \
	python-termcolor \
	python3-paramiko \
	autopoint \
	libncurses5-dev \
	subversion \
	zlib1g-dev \
	doxygen doxygen-latex texlive-base texlive-fonts-recommended \
	zip unzip \
	gettext \
	libssl-dev \
	python-pip python-lxml \
	libxml2-utils \
	libbsd-dev \
	libpcap-dev \
	ocaml-nox \
	openvswitch-common openvswitch-switch \
	autoconf \
	bison \
	flex \
	libacl1-dev \
	libtool \
	gawk \
	gnutls-dev \
	libcurl4-openssl-dev \
	libjson-c-dev \
	sharutils \
	tcsh \
	git \
	u-boot-tools \
	device-tree-compiler \
	libmosquitto1 \
	libmosquitto-dev \
	libprotobuf-c1 \
	libprotobuf-c-dev \
	libev4 \
	libev-dev \
	libjansson4 \
	libjansson-dev \
	protobuf-c-compiler && \
	rm -rf /var/lib/apt-lists/* && \
	echo "dash dash/sh boolean false" | debconf-set-selections && \
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN useradd -ms /bin/bash -p build build && \
	usermod -aG sudo build

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Set environment variables.
ENV LANG en_US.utf8

USER build

# Define working directory.
WORKDIR /home/build

# Define default command.
CMD ["bash"]

