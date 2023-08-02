FROM docker.io/texlive/texlive:latest

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      file \
      qpdf \
      exiftool \
      ; \
      rm -rf /var/lib/apt/lists/*

WORKDIR /workdir
