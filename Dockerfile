FROM golang:alpine as build

RUN set -ex \
    && apk --no-cache add make \
    && true

WORKDIR /usr/src/app

COPY . .

RUN set -ex \
    && make build \
    && true

FROM alpine:3.16

COPY --from=build /usr/src/app/hello-native /usr/local/bin/
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["hello-native"]
