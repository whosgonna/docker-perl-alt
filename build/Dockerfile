## Create the build version from the runtime version.  This mostly involves
## adding dev packages for installing additional libraries.
FROM whosgonna/perl-runtime:latest AS build

## Switch to root to install our dev packages so we can compile XS modules,
## SSL modules, etc
USER root
RUN apk --no-cache add build-base zlib-dev perl-dev libressl-dev \
                       expat-dev libxml2-dev perl-test-harness-utils \
                       openssl-dev

USER perl

