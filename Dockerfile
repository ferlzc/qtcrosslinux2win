# Dockerfile for building a cross developing environment for Qt
# targeting Windows. It also builds the application in the current
# directory. The application will be statically linked against
# Qt.
# (c) 2018 by Fernando Luiz Cola

FROM debian:stretch

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	autopoint \
	binutils \
	bison \
	build-essential \
	ca-certificates \
	cmake \
	debhelper \
	devscripts \
	fakeroot \
	flex \
	gcc \
	git \
	gperf \
	intltool \
	libgdk-pixbuf2.0-dev \
	libffi-dev \
	libgmp-dev \
	libmpc-dev \
	libmpfr-dev \
	libtool \
	libtool-bin \
	libz-dev \
	openssl \
	patch \
	pkg-config \
	p7zip-full \
	ruby \
	scons \
	subversion \
	texinfo \
	unzip \
	wget

# Prepapre and download cross development environment
RUN mkdir /build
WORKDIR  /build
RUN git clone https://github.com/mxe/mxe.git

# Build cross environment
RUN cd mxe && make qtbase
RUN cd mxe && make qtdeclarative
RUN cd mxe && make qtquickcontrols
RUN cd mxe && make qtquickcontrols2

# Enhance path
ENV PATH /build/mxe/usr/bin:$PATH

# Add a qmake alias
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.static-qmake-qt5 /build/mxe/usr/bin/qmake

