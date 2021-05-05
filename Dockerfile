FROM cinwell/notea AS notea

RUN echo "Notea Pulled"

FROM minio/minio AS minio

RUN echo "MinIO Pulled"

FROM node:alpine

## MinIO Setup
COPY --from=minio /usr/bin/minio /usr/bin/minio

## Notea Setup
COPY --from=notea /app/public /notea/public
COPY --from=notea /app/.next /notea/.next
COPY --from=notea /app/node_modules /notea/node_modules

## Make both work together
RUN apk add --update curl ca-certificates supervisor bash
COPY root/ /
RUN chmod +x /etc/*-Start.sh /start

EXPOSE 3000
EXPOSE 9000

CMD /bin/bash /start