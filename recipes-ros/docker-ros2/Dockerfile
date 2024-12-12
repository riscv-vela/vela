# 도커 이미지 설정
FROM ubuntu:22.04

# 작성자 정보
LABEL authors="Mun-Sik, Park <boggle70@falinux.com>"

# 패키지 업데이트 및 설치 
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y \
    build-essential \
    emacs \
    git \
    build-essential \
    texinfo \
    bison \
    flex \
    autoconf \
    automake \
    curl \
    gperf \
    libtool \
    patchutils \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    gawk \
    file \
    zlib1g-dev \
    libssl-dev \
    ibglib2.0-dev \
    libpixman-1-dev \
    device-tree-compiler \
    autotools-dev \
    apt-utils wget \
    cpio \
    python3 \
    unzip \    
    bc \
    libncurses5-dev \
    expat \
    libexpat1-dev \
    qemu \
    g++ \
    rsync \
    readline-common \
    strace \
    remake \
    libusb-1.0-0-dev \
    pkg-config \
    libterm-readline-gnu-perl \
    net-tools \
    locales \
    vim

# install vim insted of xxd
RUN mkdir -p /work

# Set locale
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8


# Ubuntu Universe repository
RUN apt-get install -y \
    software-properties-common 
RUN add-apt-repository universe


# add ROS 2 GPG key with apt
RUN apt-get update
RUN apt-get install curl -y 
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null


# install dev tools
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y \
  python3-flake8-blind-except \
  python3-flake8-class-newline \
  python3-flake8-deprecated \
  python3-mypy \
  python3-pip \
  python3-pytest \
  python3-pytest-cov \
  python3-pytest-mock \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  python3-pytest-runner \
  python3-pytest-timeout \
  ros-dev-tools


# toolchain build
ENV HOME /home/build
RUN useradd -m -s /bin/bash build
#USER build

# 추가적인 설정 또는 명령어
#RUN mkdir -p /work

# 컨테이너 실행시 실행될 명령어
CMD ["/bin/bash"]
