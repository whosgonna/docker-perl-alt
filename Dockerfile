## The Runtime version
FROM alpine:latest AS runtime

## Prepare the image:
##      1. Adding things we need for a minimum viable image:  Maybe this is open for
##         debate?
##      2. Install cpanminus.
##      3. Install Carton and cpm (not sure how much we need Carton?)
##      4. Clean up cpann work dirs
##      5. Add our /app and /perl_lib dirs (is /perl_lib a bad name?)
RUN apk --no-cache add curl wget perl make ca-certificates zlib libressl \
                       zlib expat gnupg libxml2 libxml2-utils openssl    \
    && curl -L https://cpanmin.us | perl - App::cpanminus                \
    && cpanm -n -q Carton App::cpm                                       \
    && rm -rf ~/.cpanm                                                   \
    && mkdir -p /app /perl_lib

#COPY scripts/ /usr/bin/
#RUN  chmod +x /usr/bin/pdi-*

## Update our per environmental paths, since we're going to install future
## dependancies to /perl_lib or possibly the /app dir.
ENV PERL5LIB=/app/lib:/deps/local/lib/perl5:/perl_lib/lib:/perl_lib/local/lib/perl5
ENV PATH=/app/bin:/deps/bin:/deps/local/bin:/perl_lib/bin:/perl_lib/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /app


## Create the build version from the runtime version.  This mostly involves
## adding dev packages for installing additional libraries.
FROM runtime AS build

RUN apk --no-cache add build-base zlib-dev perl-dev libressl-dev \
                       expat-dev libxml2-dev perl-test-harness-utils \
                       openssl-dev


## The Devel version.  Do we need a 'devel' environment?  Can people just use
## the build image for development?  Commenting this out for now, beause we 
## don't want the default build action to be producing the devel image.
#
#FROM build AS devel
#
#ENV PERL5LIB=$PERL5LIB:/app/.docker-perl-local/lib/perl5
#ENV PATH=$PATH:/app/.docker-perl-local/bin
#
#ENTRYPOINT [ "/usr/bin/pdi-entrypoint" ]
