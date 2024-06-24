FROM bililive/recorder:latest
ENV TZ=Asia/Shanghai

ENV UMASK=022
ENV PUID=0
ENV PGID=0

COPY --from=tianon/gosu /gosu /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [ "run", "--bind", "http://*:2356", "/rec" ]
