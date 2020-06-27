## The Runtime version
FROM alpine:latest 

## Prepare the image:
##      1. Adding things we need for a minimum viable image:  Maybe this is open for
##         debate?
##      2. Install cpanminus.
##      3. Install cpm (for faster module deployment)
##      4. Clean up cpann work dirs
##      5. Create our non-root user, 'perl'
##      5. Make the perl library directory for our perl user
RUN apk --no-cache add curl wget perl make ca-certificates zlib libressl \
                       zlib expat gnupg libxml2 libxml2-utils openssl    \
    && curl -L https://cpanmin.us | perl - App::cpanminus \
    && cpanm -n -q App::cpm \
    && rm -rf ~/.cpanm \
    && adduser --disabled-password --gecos "perl user" --home /home/perl perl \
    && mkdir -p /home/perl/perl5 \
    && chown -R perl:perl /home/perl

## Switch the user and homedir in our application
USER perl
WORKDIR /home/perl

## Configure local::lib here.  The reason to have
ENV PERL_LOCAL_LIB_ROOT=/home/perl/perl5
ENV PERL_MB_OPT="--install_base \"/home/perl/perl5\""
ENV PERL5LIB=/home/perl/perl5/lib/perl5
ENV PERL_MM_OPT=INSTALL_BASE=/home/perl/perl5
ENV PATH=/home/perl/perl5/bin:$PATH


## NOTE
## use cpm to install modules with the -g flag.
