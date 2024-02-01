FROM golang:1.19-alpine3.16 AS builder
WORKDIR /app
RUN apk add alpine-sdk
COPY /merchant .
# RUN go mod download
RUN go build -o merchant

FROM alpine:3.16

WORKDIR /app

RUN apk update && apk add --no-cache git
RUN apk update && apk add --no-cache tzdata
ENV TZ="Asia/Jakarta"

COPY --from=builder /app/merchant .
COPY --from=builder /app/.env .

EXPOSE 8888 8887

ENTRYPOINT [ "/app/merchant" ]
