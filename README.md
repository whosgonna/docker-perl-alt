# Perl Docker Image System #

![Docker Pulls](https://img.shields.io/docker/pulls/melopt/perl-alt.svg)
![Docker Build Status](https://img.shields.io/github/issues/melo/docker-perl-alt.svg)

This set of images provide a full and extensible setup to run your Perl
applications with Docker.

There are corresponding images on Docker Hub produced from this project:
 
* **`whosgonna/perl-build`:** This image is 310 MB as of commit [32835304ac7e5d7a8c587009bf35b8adabba191a].  It contains
the development libraries needed for compiling XS modules as well as the development
libraries for most perl ssl modules.
* **`whosgonna/perl-runtime`:** This image is is 70 MB as of commit 32835304ac7e5d7a8c587009bf35b8adabba191a.  
It does not contain the libraries needed for XS module compiling or for compliing SSH modules, but it should
be able to use those modules.

Both images contain `cpan-minus`, `Carton`, and `App::cpm`.  The recommended way to use this is to put
your `cpanfile` and (optionally) `cpanfile.snpashot` file in to `/home/perl/` on the **`whosgonna/perl-build`**
image, and then run `cpm install` to install the modules, followed by `carton install` to create the 
cpanfile.snapshot.  This will install the modules to /home/perl/local.  In a staged build the 
/home/perl/local directory can be copied from the build image to the runtime image. 



# Author #
[Ben Kaufman](mailto:ben.whosgonna.com@gmail.com) 

Based off of work from: [Pedro Melo](mailto:melo@simplicidade.org) 
