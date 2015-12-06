FROM        debian

RUN apt-get update && apt-get install -y supervisor

ADD         etcd/etcd        /bin/etcd
ADD         core/core        /bin/core
ADD         gateway/gateway  /bin/gateway
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/data"]
VOLUME ["/logs"]

EXPOSE 8080
CMD ["/usr/bin/supervisord"]

