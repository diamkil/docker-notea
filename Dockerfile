FROM cinwell/notea AS notea

RUN echo "Notea Pulled"

FROM minio/minio as minio

RUN echo "MinIO Pulled"

FROM node:alpine

## MinIO Setup
COPY --from=minio /usr/bin/minio /usr/bin/minio
COPY --from=minio /licenses/CREDITS /licenses/CREDITS
COPY --from=minio /licenses/LICENSE /licenses/LICENSE

RUN \
    apk update && \
    apk add curl ca-certificates

## Notea Setup


COPY --from=notea /app/public /notea/public
COPY --from=notea /app/.next /notea/.next
COPY --from=notea /app/node_modules /notea/node_modules

## Make both work together
COPY Docker-Start.sh MinIO-Start.sh Notea-Start.sh /
RUN chmod +x /Docker-Start.sh MinIO-Start.sh Notea-Start.sh
RUN apk add screen

EXPOSE 3000

CMD /Docker-Start.sh