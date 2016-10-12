FROM imega/base-builder:1.2.0

MAINTAINER Eric VILLARD <dev@eviweb.fr>

ADD build/rootfs.tar.gz /

ENTRYPOINT ["/usr/local/bin/entrypoint"]
