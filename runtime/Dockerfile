## The Runtime version
FROM alpine:latest 

## Prepare the image:
##      1. Adding things we need for a minimum viable image:  Maybe this is open for
##         debate?
##      2. Install cpanminus.
##      3. Install cpm (for faster module deployment) and Carton (for creating
##         the cpanfile.snapshot file)
##      4. Clean up cpanm work dirs
##      5. Create our non-root user, 'perl'
##      5. Make the perl library directory for our perl user
RUN apk --no-cache add curl wget perl make ca-certificates zlib libressl \
                       zlib expat gnupg libxml2 libxml2-utils openssl    \
    && curl -L https://cpanmin.us | perl - App::cpanminus \
    && cpanm -n -q App::cpm Carton \
    && rm -rf ~/.cpanm \
    && adduser --disabled-password --gecos "perl user" --home /home/perl perl \
    && mkdir -p /home/perl/app \
    && chown -R perl:perl /home/perl

## Switch the user and homedir in our application
USER perl
WORKDIR /home/perl

