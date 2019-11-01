FROM rocker/verse:3.6.1

RUN apt-get update && apt-get install -y --no-install-recommends \
  git-crypt \
  bzip2

COPY DESCRIPTION /pkg/DESCRIPTION
RUN Rscript -e "remotes::install_deps('/pkg')"
RUN Rscript -e "webdriver::install_phantomjs()"
