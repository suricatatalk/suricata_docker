FROM        debian

RUN apt-get update && apt-get install -y supervisor

ENV AUTH_PORT 8080
ENV CORE_PORT 7070
ENV MONGODB_URI uumpsckuf83d4nc:8A2FtJsf7KKWZXuJhJ8r@bu9k2c6uozobcy6-mongodb.services.clever-cloud.com:27017/bu9k2c6uozobcy6
ENV MONGODB_DB bu9k2c6uozobcy6


ADD         etcd/etcd        /bin/etcd
ADD         core/core        /bin/core
ADD         auth/auth        /bin/auth
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/data"]
VOLUME ["/logs"]

EXPOSE 8080
CMD ["/usr/bin/supervisord"]
