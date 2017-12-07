FROM ruby:2.4

MAINTAINER Weithenn Wang <weithenn@weithenn.org>

# Install redis-stat and setting Timezone
RUN gem install redis-stat && \
    echo Asia/Taipei > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

EXPOSE 63790/tcp

CMD ["redis-stat"]
