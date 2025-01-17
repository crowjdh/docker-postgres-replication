FROM arm32v7/postgres:14

RUN apt-get update -y
RUN apt-get install -y iputils-ping

ENV PG_MAX_WAL_SENDERS 8
ENV PG_WAL_KEEP_SIZE 128

COPY setup-replication.sh /docker-entrypoint-initdb.d/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY standby.signal /tmp/standby.signal

RUN chmod +x /docker-entrypoint-initdb.d/setup-replication.sh /usr/local/bin/docker-entrypoint.sh

COPY docker-healthcheck /usr/local/bin/
HEALTHCHECK CMD ["docker-healthcheck"]

## debug
# ENTRYPOINT ["tail", "-f", "/dev/null"]
