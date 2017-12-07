FROM redis:4.0.6-alpine

MAINTAINER Weithenn Wang <weithenn@weithenn.org>

# Install tzdata for Timezone
RUN apk add --no-cache tzdata && \
    \
# Download Redis Sentinel configuration file example
    cd /tmp && \
    wget http://download.redis.io/redis-stable/sentinel.conf && \
    mkdir -p /etc/redis && \
    cp sentinel.conf /etc/redis/ && \
    sed -i 's,# protected-mode no,protected-mode no,g' /etc/redis/sentinel.conf && \
    sed -i 's,sentinel monitor mymaster 127.0.0.1 6379 2,sentinel monitor redis-ha redis_master 6379 2,g' /etc/redis/sentinel.conf && \
    sed -i 's,sentinel down-after-milliseconds mymaster 30000,sentinel down-after-milliseconds redis-ha 5000,g' /etc/redis/sentinel.conf && \
    sed -i 's,sentinel parallel-syncs mymaster 1,sentinel parallel-syncs redis-ha 1,g' /etc/redis/sentinel.conf && \
    sed -i 's,sentinel failover-timeout mymaster 180000,sentinel failover-timeout redis-ha 60000,g' /etc/redis/sentinel.conf && \
    \
# Tuning TCP backlog
# Please reference Redis Administration (https://redis.io/topics/admin)
    touch /etc/redis/run.sh && \
    echo "echo 32768 > /wproc/sys/net/core/somaxconn" >> /etc/redis/run.sh && \
    echo "redis-sentinel /etc/redis/sentinel.conf" >> /etc/redis/run.sh && \
    chmod 755 /etc/redis/run.sh && \
    chown -R redis:redis /etc/redis

ENV TZ=Asia/Taipei

EXPOSE 26379/tcp

CMD ["/etc/redis/run.sh"]
