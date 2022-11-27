FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt update && apt upgrade -y && \
	apt install -y build-essential perl git

WORKDIR /usr/src
RUN git clone --recursive https://github.com/TransDecoder/TransDecoder.git && \
	cd TransDecoder && \
	git reset --hard b7e1501377f855d6c1c4b9421b5965eb2bb0873d && \
	chmod a+x TransDecoder.LongOrfs TransDecoder.Predict
ENV PATH="/usr/src/TransDecoder/:$PATH"

ENV PERL_MM_USE_DEFAULT=1
RUN cpan URI
