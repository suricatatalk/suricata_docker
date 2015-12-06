FROM        debian

RUN apt-get update && apt-get install -y supervisor curl

ADD         etcd/etcd        /bin/etcd
ADD         core/core        /bin/core
ADD         gateway/gateway  /bin/gateway
ADD         test/test.sh  /test/test.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/data"]
VOLUME ["/logs"]

EXPOSE 8080
CMD ["/usr/bin/supervisord"]

