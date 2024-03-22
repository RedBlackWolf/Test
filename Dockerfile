FROM rockylinux:8

LABEL maintainer="Joonha Park <haruna@mocomsys.com>"

USER root

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial && \
  dnf -y update && \
  dnf install -y epel-release && \
  /usr/bin/crb enable && \
  dnf install -y \
      libuuid-devel \
      libXpm-devel \
      libX11-devel \
      wget \
      ca-certificates \
      openssl-devel \
      java-1.8.0-openjdk-headless \
      tzdata-java \
      libaio \
      unzip \
      file \
      pigz \
      systemd-devel \
      xz-devel \
      libnsl \
      perl-IPC-Cmd \
      glibc-devel \
      glibc-langpack-en \
      glibc-langpack-ko \
      glibc-gconv-extra \
      dstat \
      inotify-tools \
      libgomp \
      gperf \
      htop \
      ftp

RUN adduser -d /MOCOMSYS mpower && echo "mpower:mpower" | chpasswd

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
