FROM redis:alpine
RUN mkdir -p /usr/local/etc/redis/
#RUN mkdir -p /var/log/redis/
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
