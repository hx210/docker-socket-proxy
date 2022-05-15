FROM haproxy:lts-alpine

EXPOSE 2375
ENV ALLOW_RESTARTS=0 \
    AUTH=0 \
    BUILD=0 \
    COMMIT=0 \
    CONFIGS=0 \
    CONTAINERS=0 \
    DISTRIBUTION=0 \
    EVENTS=1 \
    EXEC=0 \
    GRPC=0 \
    IMAGES=0 \
    INFO=0 \
    LOG_LEVEL=info \
    NETWORKS=0 \
    NODES=0 \
    PING=1 \
    PLUGINS=0 \
    POST=0 \
    SECRETS=0 \
    SERVICES=0 \
    SESSION=0 \
    SOCKET_PATH=/var/run/docker.sock \
    SWARM=0 \
    SYSTEM=0 \
    TASKS=0 \
    VERSION=1 \
    VOLUMES=0 \
    BIND=":2375" \
    haproxy_run_pid_path=/run/haproxy \
    haproxy_server_state_file_path=/var/lib/haproxy
USER root
RUN set -xeu \
    && mkdir -p ${haproxy_run_pid_path} \
    && chown -R haproxy:haproxy ${haproxy_run_pid_path} \
    && chown -R haproxy:haproxy ${haproxy_server_state_file_path}

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
