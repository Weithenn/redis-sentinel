FROM redis:4.0.6-alpine

MAINTAINER Weithenn Wang <weithenn@weithenn.org>

# Install tzdata for Timezone
RUN apk add --no-cache tzdata && \
    \
# Download Redis configuration file example
    cd /tmp && \
    wget http://download.redis.io/redis-stable/redis.conf && \
    mkdir -p /etc/redis && \
    cp redis.conf /etc/redis/ && \
    \
# This is Redis [Master] confgiruation
# bind 0.0.0.0, Disable RDB file and AOF log, tuning TCP backlog
    sed -i 's,bind 127.0.0.1,bind 0.0.0.0,g' /etc/redis/redis.conf && \
    sed -i 's/^\(save .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's,#   save "",save "",g' /etc/redis/redis.conf && \
    sed -i 's,stop-writes-on-bgsave-error yes,stop-writes-on-bgsave-error no,g' /etc/redis/redis.conf && \
    sed -i 's,hz 10,hz 50,g' /etc/redis/redis.conf && \
    sed -i 's,tcp-backlog 511,tcp-backlog 32768,g' /etc/redis/redis.conf && \
    \
# Tuning TCP backlog, No memory overcommit handling, Disable THP(Transparent Huge Pages)
# Please reference Redis Administration (https://redis.io/topics/admin)
    touch /etc/redis/run.sh && \
    echo "echo 32768 > /wproc/sys/net/core/somaxconn" >> /etc/redis/run.sh && \
    echo "echo 1 > /wproc/sys/vm/overcommit_memory" >> /etc/redis/run.sh && \
    echo "echo never > /wsys/kernel/mm/transparent_hugepage/enabled" >> /etc/redis/run.sh && \
    echo "echo never > /wsys/kernel/mm/transparent_hugepage/defrag" >> /etc/redis/run.sh && \
    echo "redis-server /etc/redis/redis.conf" >> /etc/redis/run.sh && \
    chmod 755 /etc/redis/run.sh && \
    chown -R redis:redis /etc/redis

ENV TZ=Asia/Taipei

EXPOSE 6379/tcp

CMD ["/etc/redis/run.sh"]
