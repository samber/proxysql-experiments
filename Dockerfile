##
# NAME              : iadvize/proxysql
# VERSION           : 1.3
# DOCKER-VERSION    : 1.12
# DESCRIPTION       : ProxySQL (1.3)
# DEPENDENCY        : none
# TO_BUILD          : docker build --pull=true --no-cache --rm -t iadvize/proxysql:1.3 -t iadvize/proxysql:latest .
# TO_SHIP           : docker push iadvize/proxysql:1.3 && docker push iadvize/proxysql:latest
# TO_RUN            : docker run --rm -h proxysql --name proxysql -p 3306:3306 iadvize/proxysql:1.3
##

FROM iadvize/debian:jessie

MAINTAINER Samuel BERTHE <samuel.berthe@iadvize.com>

ENV DEBIAN_FRONTEND="noninteractive" \
    PROXYSQL_VERSION="1.3.0f"

RUN apt-get update && \
    curl -L -o /opt/proxysql.deb https://github.com/sysown/proxysql/releases/download/$PROXYSQL_VERSION/proxysql_$PROXYSQL_VERSION-debian8_amd64.deb && \
    dpkg -i /opt/proxysql.deb && \
    rm -f /opt/proxysql.deb && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint.sh"]

ADD router/proxysql.cnf /etc/proxysql.cnf
ADD router/docker-entrypoint.sh /docker-entrypoint.sh

# Expose ports.
EXPOSE 3306
