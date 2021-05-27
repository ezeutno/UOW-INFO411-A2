FROM rocker/r-base:3.6.3

ADD 01_install_packages.R 01_install_packages.R

RUN Rscript 01_install_packages.R